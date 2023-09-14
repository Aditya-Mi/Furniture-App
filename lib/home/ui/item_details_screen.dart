import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/models/product.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Product product;
  const ItemDetailsScreen({super.key, required this.product});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width - 130;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.56,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: h * 0.56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.images[0]),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      left: 32,
                      top: 53,
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: backgroundColor),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
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
                height: h * 0.44,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontFamily: 'Gelasio',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: homeScreenItemPriceColor),
                    ),
                    SizedBox(
                      height: h * 0.0123,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${widget.product.price}',
                          style: const TextStyle(
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
                                  icon: SvgPicture.asset(
                                      'assets/icons/minus.svg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.0123,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${widget.product.productRating}',
                          style: const TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: homeScreenItemPriceColor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '(50 reviews)',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: totalColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.0184,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.109,
                        child: Text(
                          widget.product.description,
                          style: const TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: homeScreenItemTextColor),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
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
                            icon: const Icon(
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
        ),
      ),
    );
  }
}
