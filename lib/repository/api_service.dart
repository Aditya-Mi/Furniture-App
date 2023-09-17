import 'package:dio/dio.dart';
import 'package:furniture_app/home/models/product.dart';

class ApiService {
  String endpoint =
      'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture';
  final dio = Dio();
  Future<List<Product>> getProduct(String category) async {
    try {
      late Response<dynamic> response;
      if (category == '' || category == 'popular') {
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
      var res = result.map((product) => Product.fromJson(product)).toList();
      if (category == 'popular') {
        // Comparator<Product> ratingComparator =
        //     (a, b) => b.productRating.compareTo(a.productRating);
        int ratingComparator(Product a, Product b) {
          return b.productRating.compareTo(a.productRating);
        }

        res.sort(ratingComparator);
      }

      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
