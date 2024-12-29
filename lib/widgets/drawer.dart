import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(
            color: darkBlueColor, size: 50), // Change the color here
      ),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: ListView(
          // padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              color: darkBlueColor,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close,
                            size: 35, color: Colors.white))),
              ),
            ),
            ListItems(context, Icons.home, 'Home', '/home'),
            ListItems(context, Icons.file_copy, 'Job Cards', '/book_service'),
            ListItems(context, Icons.directions_car, 'My Garage', '/my_garage'),
            ListItems(context, Icons.account_circle, 'Log in or Create Account',
                '/login'),
            const Divider(),
            ListItemsWithoutIcon(context, '', "Total Job Cards"),
            ListItemsWithoutIcon(context, '', "Completed Job Cards"),
            ListItemsWithoutIcon(context, '', "Ongoing Job Cards"),
            const Divider(),
            const Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5),
              child: Text('About',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(height: 8),
            ListItemsWithoutIcon(context, '', "About us"),
            ListItemsWithoutIcon(context, '', "Contact us"),
          ],
        ),
      ),
    );
  }

  GestureDetector ListItemsWithoutIcon(
      BuildContext context, String route, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }

  ListTile ListItems(
      BuildContext context, IconData? icon, String title, String route) {
    return ListTile(
      leading: (icon == null)
          ? null
          : Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            color: greyColor,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w400),
      ),
      onTap: () {
        // Navigate to the home screen
        Navigator.pushNamed(context, route);
      },
    );
  }
}
