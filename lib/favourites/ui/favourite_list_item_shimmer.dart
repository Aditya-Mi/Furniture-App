import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/shimmer_widget.dart';

class FavouriteListItemShimmer extends StatelessWidget {
  const FavouriteListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ShimmerWidget.circular(
            width: 100,
            height: 100,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          const SizedBox(
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(width: double.infinity, height: 14),
                SizedBox(
                  height: 5,
                ),
                ShimmerWidget.rectangular(width: double.infinity, height: 16),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidget.circular(
                  width: 24,
                  height: 24,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                ShimmerWidget.circular(
                  width: 34,
                  height: 34,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
