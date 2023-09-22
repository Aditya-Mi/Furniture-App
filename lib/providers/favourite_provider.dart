import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/favourites/models/favourite_item.dart';
import 'package:furniture_app/providers/firestore_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';
import 'package:furniture_app/repository/firestore_repository.dart';

final favouriteItemsProvider = StreamProvider((ref) {
  final user = ref.read(userProvider).value;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('favourite')
      .snapshots();
});

class FavouritesNotifier extends StateNotifier<bool> {
  final FirestoreRepository _firestoreRepository;

  FavouritesNotifier(this._firestoreRepository) : super(false);

  bool isFavourite = false;

  Future<void> checkIsInFavourites(String productId, String uid) async {
    final isInFavourites = await _firestoreRepository.isInFavourites(
        productId: productId, uid: uid);
    isFavourite = isInFavourites;
    state = isFavourite;
  }

  Future<void> toggleFavouriteStatus(String productId, String uid,
      [FavouriteItem? favouriteItem]) async {
    if (isFavourite) {
      await _firestoreRepository.deleteFavouriteItem(productId, uid);
    } else {
      if (favouriteItem != null) {
        await _firestoreRepository.addFavouriteItem(favouriteItem, uid);
      }
    }
    isFavourite = !isFavourite;
    state = isFavourite;
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, bool>((ref) {
  final firestoreRepository = ref.watch(firestoreProvider);
  return FavouritesNotifier(firestoreRepository);
});
