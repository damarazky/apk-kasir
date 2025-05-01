import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:get/get.dart';
import 'produk_controller.dart';

class CheckoutController extends GetxController {
  final ProdukController produkController = Get.find<ProdukController>();

  var selectedProduk = <ProdukCheckoutModel>[].obs;

  @override
  void onInit() {
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

  void tambahJumlah(int index) {
    if (selectedProduk[index].jumlah < selectedProduk[index].stok) {
      selectedProduk[index].jumlah++;
      selectedProduk.refresh();
    }
  }

  void kurangJumlah(int index) {
    if (selectedProduk[index].jumlah > 1) {
      selectedProduk[index].jumlah--;
      selectedProduk.refresh();
    }
  }

  void hapusProduk(int index) {
    selectedProduk.removeAt(index);
  }

  double get totalHarga =>
      selectedProduk.fold(0, (sum, item) => sum + item.harga * item.jumlah);

  
}
