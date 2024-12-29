import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/create_job_cards/car_details.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:happymiles/widgets/my_appbar.dart';

class CustomerDetailsJobCardScreen extends StatefulWidget {
  @override
  State<CustomerDetailsJobCardScreen> createState() =>
      _CustomerDetailsJobCardScreenState();
}

class _CustomerDetailsJobCardScreenState
    extends State<CustomerDetailsJobCardScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController carCompanyController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController carYearController = TextEditingController();
  final TextEditingController carVariantController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  bool isTwoWheeler = false;

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
              child: Center(
                child: Text(
                  'Job Cards',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),

            // vehicle details
            Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 251, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Color.fromRGBO(238, 245, 255, 1), width: 3)),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Text(
                    'Create new Job Card',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),

                  // Vehicle Type Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Vehicle type:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: greyColor),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isTwoWheeler,
                            onChanged: (value) {
                              setState(() {
                                isTwoWheeler = !isTwoWheeler;
                              });
                            },
                            fillColor:
                                WidgetStateProperty.all(Colors.grey[300]),
                            checkColor: darkBlueColor,
                          ),
                          Text(
                            "2 wheeler",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: !isTwoWheeler,
                            onChanged: (value) {
                              setState(() {
                                isTwoWheeler = !isTwoWheeler;
                              });
                            },
                            fillColor:
                                WidgetStateProperty.all(Colors.grey[300]),
                            checkColor: darkBlueColor,
                          ),
                          Text(
                            "4 wheeler",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Vehicle Details Section
                  Container(
                    decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Choose your Vehicle",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                            "Enter the company of Card", carCompanyController),
                        const SizedBox(height: 10),
                        MyTextFormField("Enter the Model", carModelController),
                        const SizedBox(height: 10),
                        MyTextFormField("Enter the year", carYearController),
                        const SizedBox(height: 10),
                        MyTextFormField(
                            "Enter the Variant", carVariantController),

                        const SizedBox(height: 10),

                        // Done Button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "done",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Vehicle Number Section
                  SizedBox(height: 20),
                  const Text(
                    "Enter your Vehicle number",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: greyColor),
                  ),
                  MyTextFormField("Vehicle Number", vehicleNumberController),
                ],
              ),
            ),

            // Customer Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section: Name
                  Center(
                    child: Text(
                      "Customer Details",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  MyTextFormField('Full name', fullNameController),
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

                  // Next Button
                  MyButton(size, 'Proceed', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => CarDetailsCreateJobCard()));
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
}
