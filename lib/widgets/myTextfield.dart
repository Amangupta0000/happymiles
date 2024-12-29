import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
    this.label,
    this.controller, {
    super.key,
  });
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        label: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 18,
                  color: greyColor,
                ),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red, // Red color for the asterisk
                ),
              ),
            ],
          ),
        ),
        // labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
