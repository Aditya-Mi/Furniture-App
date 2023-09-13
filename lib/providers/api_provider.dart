import 'package:furniture_app/repository/api_service.dart';
import 'package:riverpod/riverpod.dart';

final productApiProvider = Provider((ref) => ApiService());
