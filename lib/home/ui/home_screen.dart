import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/home/ui/grid_view_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/providers/product_provider.dart';

final dio = Dio();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
        body: ref.watch(productFilteredDataProvider).when(data: (data) {
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
                      GestureDetector(
                          child: listItem('Chair', 'assets/icons/chair.svg')),
                      const SizedBox(width: 10),
                      GestureDetector(
                          child: listItem('Table', 'assets/icons/table.svg')),
                      const SizedBox(width: 10),
                      GestureDetector(
                          child: listItem(
                              'Armchair', 'assets/icons/armchair.svg')),
                      const SizedBox(width: 10),
                      GestureDetector(
                          child: listItem('Bed', 'assets/icons/bed.svg')),
                      const SizedBox(width: 10),
                      GestureDetector(
                          child: listItem('Lamp', 'assets/icons/lamp.svg')),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.54,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final product = data[index];
                        return GridViewItem(
                          product: product,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }, error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  Widget listItem(String name, String imgPath) {
    return SizedBox(
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
    );
  }
}
