import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton(
    this.size,
    this.text,
    this.onPressed, {
    super.key,
  });
  final Size size;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size.width * 0.8, 0),
          backgroundColor: darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: yellowColor,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
