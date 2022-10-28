import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../models/constans_colors.dart';
import '../ui_components/AppBar_Component.dart';
import '../ui_components/product_box_component.dart';

class HomePage extends StatelessWidget {

  ProductController productController = Get.find();

  HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    productController.getProduct();

    return Scaffold(
      appBar: AppBarComponent(),
      body: layout(),
    );
  }

  Widget layout(){
    return SingleChildScrollView(
      child: Column(
        children: [
          prod(),
          Container(
            height: 72,
            color: const Color(ConstantsColors.int_footerbg),
            child: Center(child: Image.asset("src/images/logofooter.png")),
          )
        ],
      ),
    );
  }


  Widget indicator(){
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget prod(){
    return
      Obx(() =>
          productController.load.value ?
             indicator()
              :
          GridView.builder(padding: EdgeInsets.all( 16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2/4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16
          ),
          itemCount: productController.products.value.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ProductBoxComponent(
              image: productController.products[index].image ?? "",
              id: productController.products[index].id ?? 0,
              name: productController.products[index].title ?? "",
              price: productController.products[index].price ?? 0.0,
              rate:  productController.products[index].rating?.rate ?? 0.0,
              reviews:  productController.products[index].rating?.count ?? 0,
            );
          }));

  }
  
}
