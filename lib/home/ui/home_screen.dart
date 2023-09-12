import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
        title: const Column(
          children: [
            Text(
              'Make home',
              style: TextStyle(
                  fontFamily: 'Gelasio', fontSize: 18, color: hintTextColor),
            ),
            Text(
              'BEAUTIFUL',
              style: TextStyle(
                  fontFamily: 'Gelasio',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Popular',
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  listItem('Chair', 'assets/icons/chair.svg'),
                  const SizedBox(width: 10),
                  listItem('Table', 'assets/icons/table.svg'),
                  const SizedBox(width: 10),
                  listItem('Armchair', 'assets/icons/armchair.svg'),
                  const SizedBox(width: 10),
                  listItem('Bed', 'assets/icons/bed.svg'),
                  const SizedBox(width: 10),
                  listItem('Lamp', 'assets/icons/lamp.svg'),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 0.61,
                  crossAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: [
                    GridViewItem(),
                    GridViewItem(),
                    GridViewItem(),
                    GridViewItem(),
                    GridViewItem(),
                    GridViewItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(String name, String imgPath) {
    return GestureDetector(
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: itemBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(imgPath),
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
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              image: const DecorationImage(
                image: AssetImage('assets/images/lampImage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Black Simple Lamp',
            style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 14,
                color: homeScreenItemTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '\$ 12.00',
            style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: homeScreenItemPriceColor),
          ),
        ],
      ),
    );
  }
}
