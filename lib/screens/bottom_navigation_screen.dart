
import 'package:ask_nano/pages/boards.dart';
import 'package:ask_nano/pages/businesses.dart';
import 'package:ask_nano/pages/home.dart';
import 'package:ask_nano/pages/polls.dart';
import 'package:ask_nano/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  PersistentTabController? _controller;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);

  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.insert_chart),
        title: "Polls",
        activeColorPrimary: Color(0xFF130CB7),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: ("Boards"),
        activeColorPrimary: Color(0xFF130CB7),
        inactiveColorPrimary: Colors.grey,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => MainScreen2(),
        //     '/second': (context) => MainScreen3(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          activeColorPrimary: Color(0xFF130CB7),
          activeColorSecondary: Colors.white,

          // routeAndNavigatorSettings: RouteAndNavigatorSettings(
          //   initialRoute: '/',
          //   routes: {
          //     '/first': (context) => MainScreen2(),
          //     '/second': (context) => MainScreen3(),
          //   },
          // ),
          // onPressed: (context) {
          //   pushDynamicScreen(context,
          //       screen: SampleModalScreen(), withNavBar: true);
          // }
          ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.business),
        title: ("Businesses"),
        activeColorPrimary: Color(0xFF130CB7),
        inactiveColorPrimary: Colors.grey,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => MainScreen2(),
        //     '/second': (context) => MainScreen3(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Color(0xFF130CB7),
        inactiveColorPrimary: Colors.grey,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => MainScreen2(),
        //     '/second': (context) => MainScreen3(),
        //   },
        // ),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      Polls(),
      Boards(),
      Home(),
      Businesses(),
      Profile(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
       borderRadius: BorderRadius.only(
         topRight: Radius.circular(10),
         topLeft: Radius.circular(10),
       ),
        border: Border(top: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
            left: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
          right: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
          bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
        ),
        colorBehindNavBar: Colors.red,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
      //  curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}


