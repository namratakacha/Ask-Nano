import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/common_widgets/text_button_common.dart';
import 'package:ask_nano/screens/login_screen.dart';
import 'package:ask_nano/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  int activeIndex = 0;
  var controller = CarouselController();

  List imageList = [
    'assets/images/ic_walkthrough_1.PNG',
    'assets/images/ic_walkthrough_2.PNG',
    'assets/images/ic_walkthrough_3.PNG'
  ];
  List titleList = [
    'One stop solution to search Business, Service & People',
    'Best way to connect to the nearby location services',
    'Get your Business Profile & promote it here'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextButtonWidget(
              title: 'SKIP',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              fontSize: 16,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: imageList.length,
            itemBuilder: (context, index, realIndex) {
              return carouselView(index);
            },
            options: CarouselOptions(
              height: 470,
              enableInfiniteScroll: false,
              // aspectRatio: 16/9,
              autoPlay: false,
              pageSnapping: true,
              initialPage: 0,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    activeIndex = index;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: imageList.length,
              effect: SlideEffect(
                spacing: 12,
                dotColor: Colors.grey,
                activeDotColor: Color(0xFF130CB7),
                dotHeight: 9,
                dotWidth: 9,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
            child: ButtonWidget(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              title: 'LOGIN',
              width: double.infinity,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New User?',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 14, color: Colors.grey),
              ),
              TextButtonWidget(
                title: 'Register',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
                fontSize: 16,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Container(
                width: double.infinity,
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Text(
            titleList[index],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                color: Color(0xFF130CB7),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
