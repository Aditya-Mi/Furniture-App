import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/profile/models/address.dart';

class AddressListItem extends StatefulWidget {
  final Address address;
  const AddressListItem({super.key, required this.address});

  @override
  State<AddressListItem> createState() => _AddressListItemState();
}

class _AddressListItemState extends State<AddressListItem> {
  var isDefault;
  @override
  void initState() {
    super.initState();
    isDefault = widget.address.isDefault;
  }

  @override
  Widget build(BuildContext context) {
    final finalAddress =
        "${widget.address.address}, ${widget.address.city}, ${widget.address.district}, ${widget.address.country}";

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
                  value: isDefault,
                  tristate: false,
                  onChanged: (value) {
                    setState(() {
                      isDefault = value;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.white,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.address.name,
                        style: const TextStyle(
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    finalAddress,
                    maxLines: 2,
                    style: const TextStyle(
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
