import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants/colors.dart';

class CategoryListItem extends StatelessWidget {
  final String name;
  final String imgPath;
  final VoidCallback function;
  final String selectedCategory;
  const CategoryListItem(
      {super.key,
      required this.name,
      required this.imgPath,
      required this.function,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: selectedCategory == name.toLowerCase()
                  ? Colors.black
                  : itemBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: function,
              icon: name == 'Popular'
                  ? Icon(
                      selectedCategory == name.toLowerCase()
                          ? Icons.star
                          : Icons.star_border,
                      color: selectedCategory == name.toLowerCase()
                          ? backgroundColor
                          : hintTextColor,
                    )
                  : SvgPicture.asset(
                      imgPath,
                      color: selectedCategory == name.toLowerCase()
                          ? Colors.white
                          : hintTextColor,
                    ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'NunitoSans',
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
