import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/profile/ui/address/address_list_item.dart';
import 'package:furniture_app/profile/ui/address/edit_address_screen.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Shipping address',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const AddressListItem();
        },
      ),
      floatingActionButton: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(138, 149, 158, 0.15),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditAddress(),
              ),
            );
          },
        ),
      ),
    );
  }
}
