import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/create_job_cards/customer_details.dart';
import 'package:happymiles/screens/home_screen.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/my_appbar.dart';
import 'package:happymiles/widgets/my_outline_button.dart';
import 'package:share_plus/share_plus.dart';

class RecieptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  SizedBox(width: 16),
                  // Customer Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ramesh Kamath',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkBlueColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Swift Dzire VDI 2016\nMH16BH8427\n8275451335\nrameshkamath43@gmail.com',
                          style: TextStyle(color: darkBlueColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // Action to edit customer and vehicle details
                    },
                    child: Text(
                      'Edit customer and vehicle details',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Call Button
                        IconButton(
                          onPressed: () {
                            // Action to call
                          },
                          icon: Image.asset('assets/call_icon.png'),
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        // WhatsApp Button
                        IconButton(
                          onPressed: () {
                            // Action to open WhatsApp
                          },
                          icon: Image.asset('assets/whatsapp_icon.png'),
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Edit and Contact Actions
              SizedBox(height: 16),
              SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/recipt.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MyOutlineButton(context, size, "Share", () async {
                      print('Sharing the reciept');
                      final result =
                          await Share.shareXFiles([XFile('assets/recipt.png')]);

                      if (result.status == ShareResultStatus.dismissed) {
                        print('Did you not like the pictures?');
                      }
                    }),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child:
                        MyOutlineButton(context, size, "Print/Download", () {}),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MyButton(size, "Update", () {
                // Action to update the job card
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CustomerDetailsJobCardScreen()));
              }),
              const SizedBox(height: 16),
              MyButton(size, "Complete", () {
                // Action to close the job card
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => HomeScreen()),
                    (route) => false);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
