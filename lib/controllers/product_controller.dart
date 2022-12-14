import 'package:get/state_manager.dart';
import 'package:flutter_boilerplate/models/product_model.dart';
import 'package:flutter_boilerplate/repositories/ProductRepository.dart';

class ProductController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxBool load = false.obs;

  Future<void> getProduct() async {
    load.value = true;

    products.value = await ProductRepository().productsGet();
    products.refresh();

    load.value = false;
  }
}
