import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';

class AddressListItem extends StatelessWidget {
  const AddressListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Use as the shipping address',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Color.fromRGBO(138, 149, 158, 0.15),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'name',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_outlined),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                const Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'address',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 14,
                      color: totalColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
