import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/models/cart_item.dart';
import 'package:furniture_app/repository/firestore_repository.dart';

class CartListItem extends StatefulWidget {
  final CartItem cartItem;
  final String uid;
  const CartListItem({super.key, required this.cartItem, required this.uid});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.cartItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.cartItem.name,
                  style: const TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: homeScreenItemTextColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$ ${widget.cartItem.price}',
                  style: const TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: homeScreenItemPriceColor),
                ),
                const Spacer(),
                SizedBox(
                  width: 130,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconBackground),
                        child: IconButton(
                          onPressed: () {},
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${widget.cartItem.price}',
                        style: const TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconBackground),
                        child: IconButton(
                          onPressed: () {},
                          padding: const EdgeInsets.all(0),
                          icon: SvgPicture.asset('assets/icons/minus.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              final res = await FirestoreRepository()
                  .deleteCartItem(widget.cartItem.id, widget.uid);
              if (res == "success" && context.mounted) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Removed from cart'),
                  ),
                );
              }
            },
            icon: SvgPicture.asset('assets/icons/cross.svg'),
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
