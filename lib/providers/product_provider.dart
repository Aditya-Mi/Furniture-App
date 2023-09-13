import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/providers/api_provider.dart';
import 'package:riverpod/riverpod.dart';

final productDataProvider = FutureProvider<List<Product>>((ref) {
  return ref.read(productApiProvider).getProduct();
});
