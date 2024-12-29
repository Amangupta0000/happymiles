import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/create_job_cards/customer_details.dart';
import 'package:happymiles/screens/search_jobcard_screen.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/my_appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header

                SizedBox(height: size.height * 0.01),

                // Stats Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      JobCardsCountContainer(
                          "Total Job Cards", "24", context, []),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: JobCardsCountContainer(
                                  "Completed Job Cards", "20", context, [])),
                          const SizedBox(width: 10),
                          Expanded(
                              child: JobCardsCountContainer(
                                  "Ongoing Job  Cards", '14', context, [])),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Create Jobcard Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => CustomerDetailsJobCardScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellowColor,
                      minimumSize: Size(double.infinity, 0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Create Jobcard",
                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: darkBlueColor),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Navigation Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "You might be looking for?",
                    style: TextStyle(
                      color: Color.fromRGBO(61, 61, 61, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildFeatureTile(
                          "", 'assets/home_screen_images/report.png'),
                    ),
                    Expanded(
                      child: _buildFeatureTile(
                          "", 'assets/home_screen_images/analytics.png'),
                    ),
                    Expanded(
                      child: _buildFeatureTile(
                          "", 'assets/home_screen_images/staff.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildFeatureTile(
                            "", 'assets/home_screen_images/expenses.png'),
                      ),
                      Expanded(
                        child: _buildFeatureTile(
                            "", 'assets/home_screen_images/feedback.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: MyDrawer()),
    );
  }

  JobCardsCountContainer(
      String title, String count, BuildContext context, List jobCardList) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => SearchJobCardsScreen(title, jobCardList)));
      },
      child: Container(
        width: double.infinity,
        // height: 120,
        decoration: BoxDecoration(
            color: Color.fromRGBO(248, 251, 255, 1),
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: Color.fromRGBO(238, 245, 255, 1), width: 3)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                count,
                style: TextStyle(
                  fontSize: 30,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Feature Tile Builder
  Widget _buildFeatureTile(String routePath, String imagePath) {
    return SizedBox(
        height: 110,
        width: 110,
        child: GestureDetector(child: Image.asset(imagePath)));
  }
}
