import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/cart/models/cart_item.dart';
import 'package:furniture_app/cart/models/cart_item_state.dart';
import 'package:furniture_app/providers/firestore_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';
import 'package:furniture_app/repository/firestore_repository.dart';

final cartItemsProvider = StreamProvider((ref) {
  final user = ref.watch(userProvider).value;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('cart')
      .snapshots();
});

class CartNotifier extends StateNotifier<CartItemState> {
  final FirestoreRepository _firestoreRepository;

  CartNotifier(this._firestoreRepository) : super(CartItemState(0, false));

  Future<void> checkIsInCart(String productId, String uid) async {
    final isInCart =
        await _firestoreRepository.isInCart(productId: productId, uid: uid);
    state = CartItemState(state.itemCount, isInCart);
  }

  Future<void> removeFromCart(String productId, String uid) async {
    await _firestoreRepository.deleteCartItem(productId, uid);
    state = CartItemState(0, false);
  }

  Future<void> addToCart(
    String uid,
    CartItem cartItem,
  ) async {
    await _firestoreRepository.addCartItem(cartItem, uid);
    state = CartItemState(cartItem.quantity, true);
  }

  Future<void> addQuantityToCart(String productId, String uid) async {
    await _firestoreRepository.addQuantityCartItem(productId, uid);
    state = CartItemState(state.itemCount + 1, state.isInCart);
  }

  Future<void> subtractQuantityToCart(String productId, String uid) async {
    await _firestoreRepository.subtractQuantityCartItem(productId, uid);
    state = CartItemState(state.itemCount - 1, state.isInCart);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartItemState>((ref) {
  final firestoreRepository = ref.watch(firestoreProvider);
  return CartNotifier(firestoreRepository);
});
