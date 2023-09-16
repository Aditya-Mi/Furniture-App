import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_app/cart/models/cart_item.dart';
import 'package:furniture_app/favourites/models/favourite_item.dart';

class FirestoreRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> addCartItem(CartItem cartItem, String uid) async {
    String res = "Some error occurred";
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(cartItem.id)
          .set(cartItem.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> addQuantityCartItem(String id, String uid) async {
    try {
      final cartItemRef = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(id);
      cartItemRef.get().then((documentSnapshot) {
        final currentQuantity = documentSnapshot.data()!["quantity"];
        final newQuantity = currentQuantity + 1;
        cartItemRef.update({"quantity": newQuantity});
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> subtractQuantityCartItem(String id, String uid) async {
    try {
      final cartItemRef = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(id);
      cartItemRef.get().then((documentSnapshot) {
        final currentQuantity = documentSnapshot.data()!["quantity"];
        final newQuantity = currentQuantity - 1;
        cartItemRef.update({"quantity": newQuantity});
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> addFavouriteItem(
      FavouriteItem favouriteItem, String uid) async {
    String res = "Some error occurred";
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('favourite')
          .doc(favouriteItem.id)
          .set(favouriteItem.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> deleteCartItem(String cartItemId, String uid) async {
    String res = "Some error occurred";
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(cartItemId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteFavouriteItem(String favouriteItemId, String uid) async {
    String res = "Some error occurred";
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('favourite')
          .doc(favouriteItemId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<bool> isInCart(String productId, String uid) async {
    try {
      final isInCart = await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productId)
          .get()
          .then((doc) => doc.exists);
      return isInCart;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> isInFavourites(
      {required String productId, required String uid}) async {
    try {
      final isInFavourites = await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('favourite')
          .doc(productId)
          .get()
          .then((doc) => doc.exists);
      return isInFavourites;
    } catch (e) {
      throw e.toString();
    }
  }
}
