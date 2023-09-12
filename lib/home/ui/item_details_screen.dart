import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width - 130;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.56,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lampImage.png'),
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 53,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: backgroundColor),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.44,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Black Simple Lamp',
                  style: TextStyle(
                      fontFamily: 'Gelasio',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: homeScreenItemPriceColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      '\$ 50.00',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: homeScreenItemPriceColor),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 115,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: iconBackground),
                            child: IconButton(
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '01',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          const Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: iconBackground),
                            child: IconButton(
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                              icon: SvgPicture.asset('assets/icons/minus.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: homeScreenItemPriceColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '(50 reviews)',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: totalColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SingleChildScrollView(
                  child: Text(
                    'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: homeScreenItemTextColor),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: iconBackground),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CustomButton(
                        function: () {},
                        text: 'Add to cart',
                        height: 60,
                        width: buttonWidth,
                        fontFamily: 'NunitoSans')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
