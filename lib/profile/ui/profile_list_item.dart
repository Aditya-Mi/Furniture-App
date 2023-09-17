import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';

class ProfileListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback function;
  const ProfileListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      elevation: 10,
      shadowColor: Colors.white70,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        shape: const BeveledRectangleBorder(),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'NuntioSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: primaryColor,
            ),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontFamily: 'NuntioSans', fontSize: 14, color: totalColor),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
        ),
      ),
    );
  }
}
