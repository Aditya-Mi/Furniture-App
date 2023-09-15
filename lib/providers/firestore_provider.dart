import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/repository/firestore_repository.dart';

final firestoreProvider = Provider((ref) => FirestoreRepository());
