import 'package:dio/dio.dart';
import 'package:furniture_app/models/product.dart';

class ApiService {
  String endpoint =
      'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture';
  final dio = Dio();
  Future<List<Product>> getProduct() async {
    try {
      Response<dynamic> response = await dio.get(endpoint);
      if (response.statusCode != 200) {
        throw 'An unexpected error occurred ';
      }
      final List result = response.data['Data'];
      return result.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
