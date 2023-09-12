import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/cart/ui/cart_list_item.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: const [
                CartListItem(),
                Divider(
                  color: dividerColor,
                ),
                CartListItem(),
                Divider(
                  color: dividerColor,
                ),
                CartListItem(),
                Divider(
                  color: dividerColor,
                ),
                CartListItem(),
                Divider(
                  color: dividerColor,
                ),
                CartListItem(),
                Divider(
                  color: dividerColor,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: totalColor,
                      ),
                    ),
                    Text(
                      '\$ 95.00',
                      style: TextStyle(
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
      ),
    );
  }
}
