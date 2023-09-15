import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  FavouriteItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  // A factory constructor to convert a map into a CartItem object.
  static FavouriteItem fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FavouriteItem(
      id: snapshot['_id'],
      name: snapshot['name'],
      price: snapshot['price'].toDouble(),
      imageUrl: snapshot['imageUrl'],
    );
  }

  factory FavouriteItem.fromJson(Map<String, dynamic> json) {
    return FavouriteItem(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        imageUrl: json["imageUrl"]);
  }

  // A method to convert a CartItem object into a map.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
