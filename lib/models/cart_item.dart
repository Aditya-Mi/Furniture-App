import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  // A factory constructor to convert a map into a CartItem object.
  static CartItem fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CartItem(
      id: snapshot['_id'],
      name: snapshot['name'],
      price: snapshot['price'].toDouble(),
      quantity: snapshot['quantity'],
      imageUrl: snapshot['imageUrl'],
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        imageUrl: json["imageUrl"]);
  }

  // A method to convert a CartItem object into a map.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }
}
