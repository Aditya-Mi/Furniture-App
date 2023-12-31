import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/profile/ui/address/address_screen.dart';
import 'package:furniture_app/profile/ui/profile_list_item.dart';
import 'package:furniture_app/providers/address_provider.dart';
import 'package:furniture_app/providers/auth_provider.dart';
import 'package:furniture_app/auth/ui/login_screen.dart';
import 'package:furniture_app/providers/user_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const BeveledRectangleBorder(),
                    title: const Text('Log Out'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          signOut();
                        },
                        child: const Text('Log out'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: user.when(
        data: (user) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1694449263303-a90c4ce18112?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
                    ),
                    SizedBox(
                      width: w * 0.053,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontFamily: 'NuntioSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: homeScreenItemPriceColor,
                          ),
                        ),
                        Text(
                          user.email,
                          style: const TextStyle(
                              fontFamily: 'NuntioSans',
                              fontSize: 14,
                              color: totalColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.044,
                ),
                ProfileListItem(
                  title: 'My order',
                  subtitle: 'Already have 10 orders',
                  function: () {},
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ProfileListItem(
                  title: 'Shipping Addresses',
                  subtitle: ' addresses',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddressScreen()));
                  },
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ProfileListItem(
                  title: 'Payment Method',
                  subtitle: 'You have 2 cards',
                  function: () {},
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ProfileListItem(
                  title: 'My reviews',
                  subtitle: 'Reviewed 5 items',
                  function: () {},
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ProfileListItem(
                  title: 'Setting',
                  subtitle: 'Notification,password,FAQ,contact',
                  function: () {},
                ),
              ],
            ),
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
    );
  }
}
