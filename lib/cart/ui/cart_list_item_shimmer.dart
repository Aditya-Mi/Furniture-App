import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/shimmer_widget.dart';

class CartListItemShimmer extends StatelessWidget {
  const CartListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
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
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.373,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(width: double.infinity, height: 14),
                SizedBox(
                  height: 5,
                ),
                ShimmerWidget.rectangular(width: double.infinity, height: 16),
                Spacer(),
                SizedBox(
                  width: 130,
                )
              ],
            ),
          ),
          const Spacer(),
          ShimmerWidget.circular(
            width: 24,
            height: 24,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
