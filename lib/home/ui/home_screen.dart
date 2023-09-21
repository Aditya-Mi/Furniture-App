import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/home/ui/category_list_item.dart';
import 'package:furniture_app/home/ui/grid_view_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/home/ui/grid_view_item_shimmer.dart';
import 'package:furniture_app/providers/product_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';

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

  void toggleCategory(String selectedCategory, String category) {
    if (selectedCategory == category) {
      ref.read(selectedCategoryProvider.notifier).state = '';
    } else {
      ref.read(selectedCategoryProvider.notifier).state = category;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
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
                      CategoryListItem(
                          name: 'Popular',
                          imgPath: 'assets/icons/chair.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'popular');
                          },
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Chair',
                          imgPath: 'assets/icons/chair.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'chair');
                          },
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Table',
                          imgPath: 'assets/icons/table.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'table');
                          },
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Armchair',
                          imgPath: 'assets/icons/armchair.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'armchair');
                          },
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Bed',
                          imgPath: 'assets/icons/bed.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'bed');
                          },
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Lamp',
                          imgPath: 'assets/icons/lamp.svg',
                          function: () {
                            toggleCategory(selectedCategory, 'lamp');
                          },
                          selectedCategory: selectedCategory),
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
                      CategoryListItem(
                          name: 'Popular',
                          imgPath: 'assets/icons/chair.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Chair',
                          imgPath: 'assets/icons/chair.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Table',
                          imgPath: 'assets/icons/table.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Armchair',
                          imgPath: 'assets/icons/armchair.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Bed',
                          imgPath: 'assets/icons/bed.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
                      const SizedBox(width: 10),
                      CategoryListItem(
                          name: 'Lamp',
                          imgPath: 'assets/icons/lamp.svg',
                          function: () {},
                          selectedCategory: selectedCategory),
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const GridViewItemShimmer();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget buildHomeShimmer() => const GridViewItemShimmer();
}
