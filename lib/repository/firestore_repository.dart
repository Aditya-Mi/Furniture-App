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
}
