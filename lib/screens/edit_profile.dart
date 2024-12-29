import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:happymiles/widgets/my_appbar.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController workshopNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();

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

              // Edit Profile Header
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
                    'Edit Profile',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),

            // Section: Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),
                  MyTextFormField('Owner\'s name', ownerNameController),
                  const SizedBox(height: 10),
                  MyTextFormField(
                      'Workshop name as GST', workshopNameController),
                  const SizedBox(height: 20),

                  // Section: Contact Details
                  const Text(
                    "Contact Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField('Phone number', phoneController),
                  const SizedBox(height: 10),
                  MyTextFormField('Email', emailController),
                  const SizedBox(height: 20),

                  // Section: Address
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField('Address', addressController),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: MyTextFormField('State', stateController)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: MyTextFormField('Country', countryController)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: MyTextFormField('City', cityController)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: MyTextFormField('Pincode', pincodeController)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Section: GST Number
                  const Text(
                    "GST number",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField('GSTIN', gstinController),
                  const SizedBox(height: 20),

                  // Next Button
                  MyButton(size, 'Save Changes', () {
                    Navigator.pop(context);
                  }),
                  const SizedBox(height: 180),
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
