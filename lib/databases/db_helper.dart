import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    _db ??= await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'produk.tb');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Tabel Produk

        await db.execute('''
            CREATE TABLE produk (
              id TEXT PRIMARY KEY,
              nama TEXT,
              harga REAL,
              laba REAL,
              stok INTEGER,
              created_at TEXT,
              updated_at TEXT
            )
          ''');

        // Tabel Tranksaksi

        await db.execute('''
            CREATE TABLE tranksaksi (
              id TEXT PRIMARY KEY,
              tanggal TEXT,
              total_harga REAL,
              metode_pembayaran TEXT,
              catatan TEXT
            )
          ''');

        // Tabel Item Tranksaksi

        await db.execute('''
            CREATE TABLE tranksaksi_item (
              id TEXT PRIMARY KEY,
              tranksaksi_id TEXT,
              produk_id TEXT,
              jumlah INTEGER,
              subtotal REAL,
              FOREIGN KEY (tranksaksi_id) REFERENCES tranksaksi(id),
              FOREIGN KEY (produk_id) REFERENCES produk(id)
            )
          ''');
      },
    );
  }

  Future<void> resetDatabase() async {
    final path = join(await getDatabasesPath(), 'produk.tb');
    await deleteDatabase(path);
    _db = null;
    await initDb();
  }
}
