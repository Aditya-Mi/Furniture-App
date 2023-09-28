import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/profile/models/address.dart';
import 'package:furniture_app/providers/firestore_provider.dart';

class EditAddress extends ConsumerStatefulWidget {
  final String uid;
  const EditAddress(this.uid, {super.key});

  @override
  ConsumerState<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends ConsumerState<EditAddress> {
  final _form = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredAddress = '';
  var _enteredZipcode = '';
  var _enteredCountry = '';
  var _enteredCity = '';
  var _enteredDistrict = '';

  void _updateAddress() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    try {
      final address = Address(
          name: _enteredName,
          address: _enteredAddress,
          zipcode: _enteredZipcode,
          country: _enteredCountry,
          city: _enteredCity,
          district: _enteredDistrict);
      final res =
          await ref.read(firestoreProvider).addAddress(address, widget.uid);
      if (res == 'success') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Address added successfully'),
            ),
          );
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }

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
                Padding(
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
                        const Field(field: 'Full Name'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Ex. Aditya Mittal"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredName = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        const Field(field: 'Address'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Enter Address"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredAddress = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        const Field(field: 'Zipcode (postal code)'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Ex. 110086"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredZipcode = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        const Field(field: 'Country'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Enter country"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredCountry = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        const Field(field: 'City'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Enter City"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredCity = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        const Field(field: 'District'),
                        TextFormField(
                          decoration: CommonStyle.inputDecoration(
                              hintText: "Enter District"),
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredDistrict = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
          function: () {
            _updateAddress();
          },
          text: 'Save Address',
          height: 60,
          width: MediaQuery.of(context).size.width * 0.90,
          fontFamily: 'NuntioSans'),
    );
  }
}

class Field extends StatelessWidget {
  final String field;
  const Field({
    super.key,
    required this.field,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      field,
      style: const TextStyle(
        color: totalColor,
        fontSize: 12,
        fontFamily: 'NunitoSans',
      ),
    );
  }
}

class CommonStyle {
  static InputDecoration inputDecoration({String hintText = ""}) {
    return InputDecoration.collapsed(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: placeHolder,
        fontSize: 16,
        fontFamily: 'NunitoSans',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
