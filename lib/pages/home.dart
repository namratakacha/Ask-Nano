import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/models/categories_model.dart';
import 'package:ask_nano/screens/bottom_navigation_screen.dart';
import 'package:ask_nano/screens/location_screen.dart';
import 'package:ask_nano/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  //var _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: Icon(Icons.notifications),
            color: Color(0xFF130CB7),
            iconSize: 30,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  useRootNavigator: true,
                  shape: RoundedRectangleBorder(
                    //the rounded corner is created here
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  context: context,
                  builder: (context) => NotificationScreen());
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Color(0xFF130CB7),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (_) => Location(),
                ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Hi, Namrata',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Colors.grey.shade800),
            ),
          ),
          Text(
            " We're here to serve you",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                color: Colors.grey.shade800),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: ButtonWidget(
              title: 'Search for Business or Trade',
              height: 70,
              onpressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 40, right: 250),
            child: SizedBox(
              height: 20,
              width: 40,
              child: Container(
                //  width: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF130CB7),
                        Color(0xFF52E5E7),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, elevation: 0),
                    onPressed: () {},
                    child: Text(
                      'CATEGORIES',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ),
          Container(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.only(left: 35, top: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      categoriesView(dataList[index]),
                  itemCount: dataList.length),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 10),
            child: ButtonWidget(
              title: 'Tap to add a Business or Trade',
              height: 70,
              onpressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: Container(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/icons/ic_chat.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget categoriesView(CategoriesModel data) {
  return SizedBox(
    width: 220,
    child: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  data.image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Center(
              child: Text(
                data.categoryName.toString(),
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
