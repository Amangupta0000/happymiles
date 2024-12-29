import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/home_screen.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/happymiles_title_logo_container.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    File? ownerPhotoPath = null;
    File? workshopPhotoPath = null;
    final TextEditingController ownerNameController = TextEditingController();
    final TextEditingController workshopNameController =
        TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController gstinController = TextEditingController();

    final size = MediaQuery.of(context).size;

    // function to pick image
    void pickImage(ImageSource source, File? _imagePath) async {
      print("Pick Image path prinint --------");
      print(_imagePath);
      ImagePicker().pickImage(source: source).then((image) {
        if (image == null) return;
        setState(() {
          print(image.path);
          setState(() {
            _imagePath = File(image.path);
          });
        });
      });
    }

    // Helper Method to Build Upload Buttons
    Widget _buildUploadButton(String label, Size size, File? _imagePath) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          pickImage(ImageSource.camera, _imagePath);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                        ),
                        color: Colors.black),
                    const SizedBox(width: 5),
                    IconButton(
                        onPressed: () {
                          pickImage(ImageSource.gallery, _imagePath);
                        },
                        icon: const Icon(Icons.photo),
                        color: Colors.black),
                  ]),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Title
              HappymilesTitleLogoContainer(),

              // Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.w400,
                          color: darkBlueColor,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.005),

                    // Section: Name
                    Center(
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextFormField('Owner\'s name', ownerNameController),
                    const SizedBox(height: 10),
                    MyTextFormField(
                        'Workshop name as GST', workshopNameController),
                    const SizedBox(height: 20),

                    // Section: Contact Details
                    const Center(
                      child: Text(
                        "Contact Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextFormField('Phone number', phoneController),
                    const SizedBox(height: 10),
                    MyTextFormField('Email', emailController),
                    const SizedBox(height: 20),

                    // Section: Address
                    const Center(
                      child: Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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
                            child:
                                MyTextFormField('Country', countryController)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: MyTextFormField('City', cityController)),
                        const SizedBox(width: 10),
                        Expanded(
                            child:
                                MyTextFormField('Pincode', pincodeController)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Section: GST Number
                    const Center(
                      child: Text(
                        "GST number",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextFormField('GSTIN', gstinController),
                    const SizedBox(height: 20),

                    // Upload Buttons
                    (ownerPhotoPath == null)
                        ? _buildUploadButton(
                            "Upload your photo", size, ownerPhotoPath)
                        : Image.file(ownerPhotoPath, width: 100, height: 100),
                    const SizedBox(height: 10),
                    _buildUploadButton(
                        "Upload workshop photo", size, workshopPhotoPath),
                    const SizedBox(height: 30),

                    // Next Button
                    MyButton(size, 'Next', () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => HomeScreen()));

                      const SizedBox(height: 50);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
