import '../models/product_model.dart';
import 'ServiceAdapter.dart';

class ProductRepository{
  Future<List<Product>> productsGet() async {
    var service = ServiceAdapter().instance;

    return service.get("https://fakestoreapi.com/products/").then((response){
      List<Product> list = [];

      response.data.forEach((v){
        try{
          list.add(new Product.fromJson(v));
        }catch(e){
          print(e);
        }
      });

      return list;
    }).catchError((onError){
      print('====== Profile GET ======\n $onError');
      // throw Exception('Profile Repository error: ' + onError);
      return [];
    });
  }
}