import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/home/ui/item_details_screen.dart';
import 'package:furniture_app/models/product.dart';

class GridViewItem extends StatelessWidget {
  final Product product;
  const GridViewItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(
                  product: product,
                )));
      },
      child: SizedBox(
        width: 160,
        height: 254,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 160,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(product.images[0]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'NunitoSans',
                  fontSize: 14,
                  color: homeScreenItemTextColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$ ${product.price}',
              style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: homeScreenItemPriceColor),
            ),
          ],
        ),
      ),
    );
  }
}
