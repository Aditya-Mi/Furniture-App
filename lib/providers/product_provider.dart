import 'package:furniture_app/home/models/product.dart';
import 'package:furniture_app/repository/api_service.dart';
import 'package:riverpod/riverpod.dart';

final productApiProvider = Provider((ref) => ApiService());

final productFilteredDataProvider = FutureProvider<List<Product>>((ref) {
  final productApi = ref.watch(productApiProvider);
  final category = ref.watch(selectedCategoryProvider);
  return productApi.getProduct(category);
});

final selectedCategoryProvider = StateProvider<String>((ref) => '');
