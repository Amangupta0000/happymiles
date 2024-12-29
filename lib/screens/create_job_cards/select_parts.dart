import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/screens/create_job_cards/delivery_details.dart';
import 'package:happymiles/widgets/MyButton.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/myTextfield.dart';
import 'package:happymiles/widgets/my_appbar.dart';
import 'package:happymiles/widgets/my_outline_button.dart';

class SelectPartScreen extends StatefulWidget {
  const SelectPartScreen({super.key});

  @override
  _SelectPartScreenState createState() => _SelectPartScreenState();
}

class _SelectPartScreenState extends State<SelectPartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter the jobs',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  color: Color.fromRGBO(230, 230, 230, 1)),
              labelColor: Colors.black,
              unselectedLabelColor: greyColor,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: 'Jobs'),
                Tab(text: 'Spare parts'),
                Tab(text: 'Lubes'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  JobsTab("Jobs", [], []),
                  JobsTab("Spare Parts", [], []),
                  JobsTab("Lubes", [], []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobsTab extends StatefulWidget {
  const JobsTab(this.title, this.customJobs, this.standardJobs, {super.key});
  final String title;
  final List customJobs;
  final List standardJobs;

  @override
  _JobsTabState createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> {
  final List<Map<String, String>> jobEntries = [
    {'job': 'Dent removal', 'amt': 'Rs.10,000'},
    {'job': 'Bonet paint', 'amt': 'Rs.10,000'},
    {'job': 'Seat cover ', 'amt': 'Rs.10,000'},
    {'job': 'Headlight replace', 'amt': 'Rs.10,000'},
  ];

  bool isAddingJob = false;

  void _toggleAddJob() {
    setState(() {
      isAddingJob = !isAddingJob;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isAddingJob)
      return AddStandardJobWidget(
          widget.title, widget.customJobs, widget.standardJobs);
    else
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  const SizedBox(height: 10),
                  MyButton(size, "Add ${widget.title} +", _toggleAddJob),
                  const SizedBox(height: 10),
                  DataTable(
                    headingRowColor:
                        const WidgetStatePropertyAll(darkBlueColor),
                    dataRowMaxHeight: 60,
                    columns: [
                      DataColumn(
                        label: Text('Jobs',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20)),
                      ),
                      DataColumn(
                        label: Text('Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20)),
                      ),
                    ],
                    rows: [
                      ...jobEntries.map(
                        (job) => DataRow(
                          cells: [
                            DataCell(Text(job['job']!)),
                            DataCell(Text(job['amt']!)),
                          ],
                        ),
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Total',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text('Rs.40,000',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MyButton(size, "Next", () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => DeliveryDetailsCreateJobCard()));
            }),
          ],
        ),
      );
  }
}

class AddStandardJobWidget extends StatefulWidget {
  const AddStandardJobWidget(this.title, this.customJobs, this.standardJobs,
      {super.key});
  final String title;
  final List customJobs;
  final List standardJobs;

  @override
  State<AddStandardJobWidget> createState() => _AddStandardJobWidgetState();
}

class _AddStandardJobWidgetState extends State<AddStandardJobWidget> {
  bool isCustomJobsExpanded = true;
  bool isStandardJobsExpanded = true;
  bool isAddingCustomJob = false;
  bool isAddingStandardJob = false;
  final List<Map<String, String>> customJobs = [
    {'job': 'Bumper Kam', 'amt': 'Rs. 550', 'count': '0'},
    {'job': 'Enginr kam', 'amt': 'Rs. 550', 'count': '0'},
    {'job': 'Headlight badli', 'amt': 'Rs. 550', 'count': '0'},
    {'job': 'Ac kam', 'amt': 'Rs. 700', 'count': '0'},
  ];

  final List<Map<String, String>> standardJobs = [
    {'job': 'Bumper Dent Removal', 'amt': 'Rs. 550', 'count': '0'},
    {'job': 'Bumper Dent Removal', 'amt': 'Rs. 550', 'count': '0'},
  ];
  Widget countButton(List jobs, int index) {
    int count = int.parse(jobs[index]['count']!);
    return count == 0
        ? ElevatedButton(
            onPressed: () {
              setState(() {
                count = 1;
                jobs[index]['count'] = count.toString();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkBlueColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Add',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: darkBlueColor),
            ),
            padding: const EdgeInsets.all(0),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                // Decrement Button
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (count > 0) {
                        count--;
                        jobs[index]['count'] = count.toString();
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  color: darkBlueColor,
                ),
                // Counter Display
                CircleAvatar(
                  backgroundColor: darkBlueColor,
                  child: Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Increment Button
                IconButton(
                  onPressed: () {
                    setState(() {
                      count++;
                      jobs[index]['count'] = count.toString();
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    size: 20,
                  ),
                  color: darkBlueColor,
                ),
              ],
            ),
          );
  }

  Widget buildJobRow(List jobs, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobs[index]['job'],
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(jobs[index]['amt'],
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: greyColor, fontSize: 16)),
                ],
              ),
              countButton(jobs, index),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isAddingStandardJob)
      return JobsTab(widget.title, widget.customJobs, widget.standardJobs);
    else if (isAddingCustomJob)
      return AddCustomJob(widget.title, widget.customJobs, widget.standardJobs);
    else
      return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Add job action function

            setState(() {
              isAddingStandardJob = true;
            });
          },
          child: Container(
            color: darkBlueColor,
            height: 60,
            child: Center(
                child: Text(
              'Save',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: yellowColor),
            )),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isAddingStandardJob = !isAddingStandardJob;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: yellowColor),
                        Text(
                          '  Show Total Jobs',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: yellowColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                  child: MyOutlineButton(
                context,
                size,
                "Add Custom Job",
                () {
                  setState(() {
                    isAddingCustomJob = true;
                  });
                },
              )),
              const SizedBox(height: 16),
              Column(
                children: [
                  // Custom Jobs Section
                  ExpansionTile(
                    title: Text(
                      'Custom Jobs',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: greyColor),
                    ),
                    trailing: Icon(
                      isCustomJobsExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        isCustomJobsExpanded = expanded;
                      });
                    },
                    initiallyExpanded: isCustomJobsExpanded,
                    children: List.generate(customJobs.length, (index) {
                      return buildJobRow(customJobs, index);
                    }),
                  ),

                  // Standard Jobs Section
                  ExpansionTile(
                    title: Text(
                      'Standard Jobs',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: greyColor),
                    ),
                    trailing: Icon(
                      isStandardJobsExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        isStandardJobsExpanded = expanded;
                      });
                    },
                    initiallyExpanded: isStandardJobsExpanded,
                    children: List.generate(standardJobs.length, (index) {
                      return buildJobRow(standardJobs, index);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

class AddCustomJob extends StatefulWidget {
  const AddCustomJob(this.title, this.customJobs, this.standardJobs,
      {super.key});
  final String title;
  final List customJobs;
  final List standardJobs;

  @override
  State<AddCustomJob> createState() => _AddCustomJobState();
}

class _AddCustomJobState extends State<AddCustomJob> {
  final TextEditingController jobNameController = TextEditingController();
  final TextEditingController jobAmountController = TextEditingController();
  bool isStandardJob = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isStandardJob)
      return AddStandardJobWidget(
          widget.title, widget.customJobs, widget.standardJobs);
    else
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                  child: MyOutlineButton(context, size, "Add Standard Job", () {
                setState(() {
                  isStandardJob = true;
                });
              })),
              const SizedBox(height: 16),
              Text('Name of the job',
                  style: Theme.of(context).textTheme.headlineMedium),
              MyTextFormField("enter name", jobNameController),
              const SizedBox(height: 16),
              Text('Amount', style: Theme.of(context).textTheme.headlineMedium),
              MyTextFormField("enter amount", jobAmountController),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Add job action function

            setState(() {
              isStandardJob = true;
            });
          },
          child: Container(
            color: darkBlueColor,
            height: 60,
            child: Center(
                child: Text(
              'Add Job',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: yellowColor),
            )),
          ),
        ),
      );
  }
}
