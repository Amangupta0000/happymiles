import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/edit_profile.dart';
import 'package:happymiles/screens/authorization/log_in_screen.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/my_appbar.dart';
import 'package:happymiles/widgets/my_outline_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: greyColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Your Profile',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),

            // Profile Header
            Container(
              height: size.height * 0.2,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[600],
                    height: size.height * 0.13,
                  ),
                  Positioned(
                    top: size.height * 0.068,
                    left: size.width * 0.05,
                    child: Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Name Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  profileDetailsItems(context, 'Owner Name', 'Kartik'),
                  profileDetailsItems(
                      context, 'Workshop Name', "ramesh auto garage"),

                  SizedBox(height: 10),

                  // Contact Details Section
                  Text(
                    'Contact Details',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  profileDetailsItems(context, "Phone No.", "8275451335"),
                  profileDetailsItems(context, 'email', 'Kartik123@gmail.com'),

                  SizedBox(height: 10),

                  // Address Section
                  Text(
                    'Address',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  profileDetailsItems(context, 'Address', 'Kolkata, India'),
                  profileDetailsItems(context, "Country", "India"),
                  profileDetailsItems(context, "State", "Maharashtra"),
                  profileDetailsItems(context, 'City', 'Karjat'),
                  profileDetailsItems(context, 'Pincode', '700001'),
                  const SizedBox(
                    height: 12,
                  ),
                  profileDetailsItems(context, "GST No.", "414402"),

                  SizedBox(height: 24),

                  // Update Details Button
                  MyButton(size, "Update details", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => EditProfileScreen()));
                  }),

                  SizedBox(height: 8),

                  // Logout Button
                  Center(
                    child: MyOutlineButton(context, size, "Logout", () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => LogInScreen()));
                    }),
                  ),

                  // Delete Account Button
                  Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Delete account action
                        },
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(
                            color: darkBlueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column profileDetailsItems(BuildContext context, String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title : ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
