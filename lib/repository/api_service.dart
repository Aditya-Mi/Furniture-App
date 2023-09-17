import 'package:dio/dio.dart';
import 'package:furniture_app/home/models/product.dart';

class ApiService {
  String endpoint =
      'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture';
  final dio = Dio();
  Future<List<Product>> getProduct(String category) async {
    try {
      late Response<dynamic> response;
      if (category == '') {
        endpoint =
            'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture';
        response = await dio.get(endpoint);
      } else {
        endpoint =
            'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture,$category';
        response = await dio.get(endpoint);
      }
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
