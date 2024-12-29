import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happymiles/screens/create_job_cards/delivery_details.dart';
import 'package:happymiles/screens/create_job_cards/select_parts.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:happymiles/widgets/my_appbar.dart';
import 'package:image_picker/image_picker.dart';

class CarDetailsCreateJobCard extends StatefulWidget {
  const CarDetailsCreateJobCard({super.key});

  @override
  State<CarDetailsCreateJobCard> createState() =>
      _CarDetailsCreateJobCardState();
}

class _CarDetailsCreateJobCardState extends State<CarDetailsCreateJobCard> {
  final TextEditingController kmReadingController = TextEditingController();
  final TextEditingController fuelLevelController = TextEditingController();
  File? _imagePath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // function to pick image
    void pickImage(ImageSource source, File? _imagePath) async {
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
    Widget _buildUploadButton(Size size, File? _imagePath) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              "Car details at Workshop entry",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),

            // Current KM Reading Input
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Current KM reading:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MyTextFormField("enter value", kmReadingController),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fuel Level Input
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Fuel level:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MyTextFormField("enter value", fuelLevelController),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Upload Photo Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    "For Dents (if any) \nupload photo",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'),
                  ),
                ),
                const SizedBox(width: 20),

                // Upload Buttons
                Expanded(flex: 4, child: _buildUploadButton(size, _imagePath)),
              ],
            ),
            const SizedBox(height: 30),

            // Next Button
            MyButton(size, 'Proceed', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => SelectPartScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
