import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/favourites/ui/favourite_list_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
        title: const Text(
          'Favourites',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          FavouriteListItem(),
          Divider(
            color: dividerColor,
          ),
          FavouriteListItem(),
          Divider(
            color: dividerColor,
          ),
          FavouriteListItem(),
          Divider(
            color: dividerColor,
          ),
          FavouriteListItem(),
          Divider(
            color: dividerColor,
          ),
          FavouriteListItem(),
          Divider(
            color: dividerColor,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
          function: () {},
          text: 'Add all to my cart',
          height: 50,
          width: MediaQuery.of(context).size.width * 0.90,
          fontFamily: 'NunitoSans'),
    );
  }
}
