import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';
import 'package:get/get.dart';
import 'produk_controller.dart';

class CheckoutController extends GetxController {
  late ProdukController produkController;

  var selectedProduk = <ProdukCheckoutModel>[].obs;
  var produks = <ProdukModel>[].obs;

  @override
  void onInit() {
    produkController = Get.put(ProdukController());
    super.onInit();
    loadSelectedProduk();
  }

  void loadSelectedProduk() {
    selectedProduk.value =
        produkController.selectedProduk.toSet().map((id) {
          final produk = produkController.produks.firstWhere((p) => p.id == id);
          return ProdukCheckoutModel(
            id: produk.id,
            nama: produk.nama,
            harga: produk.harga,
            stok: produk.stok ?? 0,
            jumlah: 1,
          );
        }).toList();
  }

  void tambahJumlah(String id) {
    final index = selectedProduk.indexWhere((p) => p.id == id);
    if (index != -1 && selectedProduk[index].jumlah < getStokProduk(id)) {
      selectedProduk[index].jumlah++;
      selectedProduk.refresh();
    }
  }

  void kurangJumlah(String id) {
    final index = selectedProduk.indexWhere((p) => p.id == id);
    if (index != -1 && selectedProduk[index].jumlah > 1) {
      selectedProduk[index].jumlah--;
      selectedProduk.refresh();
    }
  }

  int getStokProduk(String id) {
    final produk = produks.firstWhereOrNull((p) => p.id == id);
    return produk?.stok ?? 0;
  }

  void hapusProduk(int index, {Function? onRemove}) {
    if (index >= 0 && index < selectedProduk.length) {
      selectedProduk.removeAt(index);
      selectedProduk.refresh();
      if (onRemove != null) {
        onRemove();
      }
    }
  }

  double get totalHarga =>
      selectedProduk.fold(0, (sum, item) => sum + item.harga * item.jumlah);
}
