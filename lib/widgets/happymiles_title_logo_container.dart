import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';

class HappymilesTitleLogoContainer extends StatelessWidget {
  const HappymilesTitleLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: Color.fromRGBO(255, 255, 255, 0.45),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
              width: 55,
              child: Image.asset(
                'assets/app_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Happy",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: darkBlueColor,
              ),
            ),
            const Text(
              "Miles",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: yellowColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
