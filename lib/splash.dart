import 'package:ask_nano/screens/walk_through_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WalkThroughScreen()),
        ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                  width: 150,
                  child: Image.asset('assets/images/splash_logo.png')),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Image.asset('assets/images/ic_splash_main.webp')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
