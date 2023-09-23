import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Add ahipping address',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  h: h,
                  field: 'Full Name',
                  hintText: 'Ex. Aditya Mittal',
                ),
                CustomTextField(
                  h: h,
                  field: 'Address',
                  hintText: 'Enter Address',
                ),
                CustomTextField(
                  h: h,
                  field: 'Zipcode (Postal code)',
                  hintText: 'Ex. 110086',
                ),
                CustomTextField(
                  h: h,
                  field: 'Country',
                  hintText: 'Select Country',
                ),
                CustomTextField(
                  h: h,
                  field: 'City',
                  hintText: 'Select City',
                ),
                CustomTextField(
                  h: h,
                  field: 'District',
                  hintText: 'Select District',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
          function: () {},
          text: 'Save Address',
          height: 60,
          width: MediaQuery.of(context).size.width * 0.90,
          fontFamily: 'NuntioSans'),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.h,
    required this.field,
    required this.hintText,
  });

  final double h;
  final String field;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: h * 0.08,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: textFieldBorder),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field,
              style: const TextStyle(
                color: totalColor,
                fontSize: 12,
                fontFamily: 'NunitoSans',
              ),
            ),
            TextFormField(
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: placeHolder,
                  fontSize: 16,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
