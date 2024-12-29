import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/profile_screen.dart';

AppBar MyAppBar(BuildContext context) {
  return AppBar(
    title:  Padding(
      padding:const  EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
         const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Happy",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: darkBlueColor,
                  ),
                ),
                TextSpan(
                  text: "Miles",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: yellowColor, // Red color for the asterisk
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ProfileScreen()));
            },
           icon: Icon( Icons.person,
            color: Colors.black,
            size: 35,
           ),
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.red,
        child: const Center(
          child: Text(
            "Ramesh Auto Garage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
