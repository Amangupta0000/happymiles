import 'package:flutter/material.dart';
import 'package:happymiles/constants.dart';
import 'package:happymiles/widgets/drawer.dart';
import 'package:happymiles/widgets/my_appbar.dart';

class SearchJobCardsScreen extends StatefulWidget {
  const SearchJobCardsScreen(this.title, this.jobCardList, {super.key});
  final String title;
  final List jobCardList;
  @override
  State<SearchJobCardsScreen> createState() => _SearchJobCardsScreenState();
}

class _SearchJobCardsScreenState extends State<SearchJobCardsScreen> {
  List _filteredItems = [];
  TextEditingController _searchController = TextEditingController();

  final List jobCards = List.generate(
    8,
    (index) => {
      'name': 'Ramesh Kamath',
      'vehicleNumber': 'MH16BH8427',
      'vehicleModel': 'Swift Dzire VDI 2016',
    },
  );
  @override
  void initState() {
    super.initState();
    _filteredItems = jobCards;

    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = jobCards
          .where((item) =>
              item['name'].toLowerCase().contains(query) ||
              item['vehicleNumber']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Column(
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
                Text(widget.title),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for Jobcard by customer name, vehicle no.',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            '${_filteredItems[index]['name']} - ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _filteredItems[index]['vehicleNumber']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _filteredItems[index]['vehicleModel']!,
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14,
                          color: darkBlueColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
