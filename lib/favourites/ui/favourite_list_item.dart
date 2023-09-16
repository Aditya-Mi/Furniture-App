import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/cart/models/cart_item.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/favourites/models/favourite_item.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:furniture_app/providers/favourite_provider.dart';

class FavouriteListItem extends ConsumerStatefulWidget {
  final FavouriteItem favouriteItem;
  final String uid;
  const FavouriteListItem(
      {super.key, required this.favouriteItem, required this.uid});

  @override
  ConsumerState<FavouriteListItem> createState() => _FavouriteListItemState();
}

class _FavouriteListItemState extends ConsumerState<FavouriteListItem> {
  @override
  Widget build(BuildContext context) {
    ref
        .read(cartProvider.notifier)
        .checkIsInCart(widget.favouriteItem.id, widget.uid);
    bool isInCart = ref.watch(cartProvider).isInCart;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.favouriteItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.favouriteItem.name,
                  maxLines: 2,
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
                  '\$ ${widget.favouriteItem.price}',
                  style: const TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: homeScreenItemPriceColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(favouritesProvider.notifier).toggleFavouriteStatus(
                          widget.favouriteItem.id,
                          widget.uid,
                        );
                  },
                  icon: SvgPicture.asset('assets/icons/cross.svg'),
                  padding: const EdgeInsets.all(0),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: iconBackground),
                  child: IconButton(
                    onPressed: () async {
                      if (isInCart) {
                        return ref
                            .read(cartProvider.notifier)
                            .addQuantityToCart(
                                widget.favouriteItem.id, widget.uid);
                      } else {
                        return ref.read(cartProvider.notifier).addToCart(
                            widget.uid,
                            CartItem(
                                id: widget.favouriteItem.id,
                                name: widget.favouriteItem.name,
                                price: widget.favouriteItem.price,
                                quantity: 1,
                                imageUrl: widget.favouriteItem.imageUrl));
                      }
                    },
                    icon: SvgPicture.asset('assets/icons/bag.svg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
