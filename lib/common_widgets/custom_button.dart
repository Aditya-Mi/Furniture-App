import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double height;
  final double width;
  final String fontFamily;
  const CustomButton(
      {super.key,
      required this.function,
      required this.text,
      required this.height,
      required this.width,
      required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromRGBO(48, 48, 48, 0.25),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
