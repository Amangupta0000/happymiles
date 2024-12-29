import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/create_job_cards/reciept.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:happymiles/widgets/my_appbar.dart';
import 'package:intl/intl.dart';

class DeliveryDetailsCreateJobCard extends StatefulWidget {
  const DeliveryDetailsCreateJobCard({super.key});

  @override
  State<DeliveryDetailsCreateJobCard> createState() =>
      _DeliveryDetailsCreateJobCardState();
}

class _DeliveryDetailsCreateJobCardState
    extends State<DeliveryDetailsCreateJobCard> {
  final TextEditingController advancePaymentController =
      TextEditingController();
  final deliveryDateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        deliveryDateController.text =
            DateFormat('dd/MM/yyyy').format(_selectedDate).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: Color.fromRGBO(248, 251, 255, 1),
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: Color.fromRGBO(238, 245, 255, 1), width: 3)),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              'Delivery Details',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Select delivery date:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkBlueColor,
                        fontFamily: 'Arial'),
                    controller: deliveryDateController,
                    decoration: InputDecoration(
                      prefixText: "till  ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      hintText: 'Select date',
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: const Icon(Icons.calendar_month_rounded),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Advance payment Input
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Advance payment:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                      MyTextFormField("enter value", advancePaymentController),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              // height: 20,
              padding: const EdgeInsets.all(5),
              color: darkBlueColor,
              child: Center(
                child: Text(
                  'Estimate',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                itemsList(context, 'Jobs', '2000'),
                Divider(),
                itemsList(context, 'Spare Parts', '4000'),
                Divider(),
                itemsList(context, 'Lubes', '3000'),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text('Rs 9000',
                          style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            MyButton(size, "Finalize Jobcard", () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => RecieptScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Padding itemsList(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          Text('Rs $value', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
