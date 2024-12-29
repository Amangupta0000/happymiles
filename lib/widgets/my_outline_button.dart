 import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';

OutlinedButton MyOutlineButton(BuildContext context, Size size ,  String text,VoidCallback onPressed ) {
    return OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      side: const BorderSide(color: darkBlueColor, width: 2),
                    ),
                    child: Text(text,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: darkBlueColor)),
                  );
  }