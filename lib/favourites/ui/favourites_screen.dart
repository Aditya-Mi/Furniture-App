import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/favourites/ui/favourite_list_item.dart';
import 'package:furniture_app/favourites/models/favourite_item.dart';
import 'package:furniture_app/providers/favourite_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteData = ref.watch(favouriteItemsProvider);
    final user = ref.read(userProvider).value;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
        title: const Text(
          'Favourites',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      ),
      body: favouriteData.when(
        data: (querySnapshot) {
          final favouriteItems = querySnapshot.docs;
          return favouriteItems.isEmpty
              ? const Center(
                  child: Text('No products in favourites.'),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: favouriteItems.length,
                  itemBuilder: (context, index) {
                    final fItem = favouriteItems[index].data();
                    final favouriteItem = FavouriteItem.fromJson(fItem);
                    return FavouriteListItem(
                      favouriteItem: favouriteItem,
                      uid: user!.uid,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
          function: () {},
          text: 'Add all to my cart',
          height: 50,
          width: MediaQuery.of(context).size.width * 0.90,
          fontFamily: 'NunitoSans'),
    );
  }
}
