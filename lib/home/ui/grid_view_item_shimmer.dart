import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/shimmer_widget.dart';

class GridViewItemShimmer extends StatelessWidget {
  const GridViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerWidget.circular(
          width: 160,
          height: 200,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ShimmerWidget.rectangular(
          height: 14,
          width: double.infinity,
        ),
        const SizedBox(
          height: 5,
        ),
        const ShimmerWidget.rectangular(
          height: 14,
          width: double.infinity,
        ),
      ],
    );
  }
}
