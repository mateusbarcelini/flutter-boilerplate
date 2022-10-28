import 'package:dio/dio.dart';

class ServiceAdapter{
  late Dio _dio;

  ServiceAdapter(){
    _dio = Dio();
  }

  _onResponse(Response e){
    print(e.data);
  }

  _onError(DioError e) {
    return e;
  }

  Dio get instance => _dio;
}