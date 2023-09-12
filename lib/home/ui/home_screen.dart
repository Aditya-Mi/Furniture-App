import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/home/ui/item_details_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final result = await http.get(Uri.parse(
          'http://fake-shop-api.ap-south-1.elasticbeanstalk.com/app/v1/products?category=furniture'));
      final data = jsonDecode(result.body);
      if (result.statusCode != 200) {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data!;
          print(data['Data'].length);
          return SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 15),
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
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.519,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                      ),
                      itemCount: data['Data'].length,
                      itemBuilder: (context, index) {
                        final item = data['Data'][index];
                        final id = item['_id'];
                        final name = item['name'];
                        final price = item['price'];
                        final image = item['images'][0];
                        return GridViewItem(
                          id: id,
                          name: name,
                          price: price,
                          image: image,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
  final String id;
  final String name;
  final int price;
  final String image;
  const GridViewItem({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ItemDetailsScreen()));
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
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
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
              '\$ $price',
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
