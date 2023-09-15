import 'package:flutter/material.dart';
import 'package:furniture_app/cart/ui/cart_screen.dart';
import 'package:furniture_app/favourites/ui/favourites_screen.dart';
import 'package:furniture_app/home/ui/home_screen.dart';
import 'package:furniture_app/profile/ui/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTap(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          FavouriteScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(_page == 0
                  ? 'assets/icons/home_fill.svg'
                  : 'assets/icons/clarity_home.svg'),
            ),
            BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(_page == 1
                    ? 'assets/icons/marker_fill.svg'
                    : 'assets/icons/marker_1.svg')),
            BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(_page == 2
                    ? 'assets/icons/cart_fill.svg'
                    : 'assets/icons/cart.svg')),
            BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(_page == 3
                    ? 'assets/icons/person_fill.svg'
                    : 'assets/icons/bi_person.svg')),
          ],
          onTap: navigationTap,
        ),
      ),
    );
  }
}
