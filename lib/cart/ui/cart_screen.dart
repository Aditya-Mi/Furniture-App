import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/cart/ui/cart_list_item.dart';
import 'package:furniture_app/cart/models/cart_item.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartItemsProvider);
    final user = ref.read(userProvider).value;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: backgroundColor,
          title: const Text(
            'Cart',
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: cartData.when(
          data: (querySnapshot) {
            final cartItems = querySnapshot.snapshot.docs;
            final cartTotal = querySnapshot.cartTotal;
            return cartItems.isEmpty
                ? const Center(
                    child: Text('No products in cart.'),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final cItem = cartItems[index].data();
                            final cartItem = CartItem.fromJson(cItem);
                            return CartListItem(
                              cartItem: cartItem,
                              uid: user!.uid,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: totalColor,
                                  ),
                                ),
                                Text(
                                  '\$ $cartTotal',
                                  style: const TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            CustomButton(
                                function: () {},
                                text: 'Check out',
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.90,
                                fontFamily: 'NunitoSans'),
                          ],
                        ),
                      ),
                    ],
                  );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
