import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/repository/api_service.dart';
import 'package:riverpod/riverpod.dart';

final productApiProvider = Provider((ref) => ApiService());

final productFilteredDataProvider = FutureProvider<List<Product>>((ref) {
  final productApi = ref.watch(productApiProvider);
  return productApi.getProduct();
});
