import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/models/favourite_item.dart';
import 'package:furniture_app/repository/firestore_repository.dart';

class FavouriteListItem extends StatefulWidget {
  final FavouriteItem favouriteItem;
  final String uid;
  const FavouriteListItem(
      {super.key, required this.favouriteItem, required this.uid});

  @override
  State<FavouriteListItem> createState() => _FavouriteListItemState();
}

class _FavouriteListItemState extends State<FavouriteListItem> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {
                    final res = await FirestoreRepository().deleteFavouriteItem(
                        widget.favouriteItem.id, widget.uid);
                    if (res == "success" && context.mounted) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Removed from favourites'),
                        ),
                      );
                    }
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
                    onPressed: () {},
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
