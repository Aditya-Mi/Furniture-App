import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Address {
  String id;
  final String name;
  final String address;
  final String zipcode;
  final String country;
  final String city;
  final String district;
  bool isDefault;

  Address({
    String? id,
    required this.name,
    required this.address,
    required this.zipcode,
    required this.country,
    required this.city,
    required this.district,
    this.isDefault = false,
  }) : id = id ?? const Uuid().v4();

  static Address fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Address(
        id: snapshot['id'],
        name: snapshot['name'],
        address: snapshot['address'],
        zipcode: snapshot['zipcode'],
        country: snapshot['country'],
        city: snapshot['city'],
        district: snapshot['district'],
        isDefault: snapshot['isDefault']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'zipcode': zipcode,
      'country': country,
      'city': city,
      'district': district,
      'isDefault': isDefault,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      zipcode: json["zipcode"],
      country: json["country"],
      city: json["city"],
      district: json["district"],
    );
  }
}
