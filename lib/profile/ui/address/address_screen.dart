import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/profile/models/address.dart';
import 'package:furniture_app/profile/ui/address/address_list_item.dart';
import 'package:furniture_app/profile/ui/address/edit_address_screen.dart';
import 'package:furniture_app/providers/address_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final addressData = ref.watch(addressesProvider);
    final user = ref.read(userProvider).value;
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
      body: addressData.when(
        data: (querysnapshot) {
          final addresses = querysnapshot.docs;
          return addresses.isEmpty
              ? const Center(
                  child: Text('No addresses added'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final aItem = addresses[index].data();
                    final address = Address.fromJson(aItem);
                    return AddressListItem(
                      address: address,
                    );
                  },
                );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
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
                builder: (context) => EditAddress(user!.uid),
              ),
            );
          },
        ),
      ),
    );
  }
}
