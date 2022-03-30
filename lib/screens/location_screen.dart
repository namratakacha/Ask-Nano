import 'package:ask_nano/common_widgets/text_button_common.dart';
import 'package:ask_nano/models/location_search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController searchController = TextEditingController();
  List<LocationModel> filterLocation = allLocations;


  void _runFilter(String enteredKeyword) {

      final suggestions = enteredKeyword.isEmpty? allLocations: allLocations.where((e) {
        var result = e.locationName!.toLowerCase();
        var input = enteredKeyword.toLowerCase();
        return result.contains(input);
      }).toList();

    // Refresh the UI
    setState(() {
      filterLocation = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        // toolbarHeight: 100,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.grey.shade800,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButtonWidget(
                title: 'Cancel',
                fontSize: 16,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
              child: Row(
                children: [
                  Icon(Icons.pin_drop),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: _runFilter,
                      cursorColor: Color(0xFF130CB7),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: searchController.text.isEmpty
                              ? null
                              : IconButton(
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Search...',
                          // contentPadding: EdgeInsets.all(14),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: filterLocation.isNotEmpty? ListView.builder(
          itemCount: filterLocation.length,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                title: Text(
                  filterLocation[index].locationName.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: Colors.grey.shade400,
                  height: 1,
                ),
              )
            ],
          )): Center(
        child: Text(
          'No results found',
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
        ),
      )


    );
  }
}
