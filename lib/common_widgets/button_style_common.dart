import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  var title;
  final onpressed;
  double? height;
  double? width;
  double? fontSize;


  ButtonWidget({Key? key, required this.title, required this.onpressed, this.height, this.width, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF130CB7),
                Color(0xFF52E5E7),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
            onPressed: () {
              onpressed();
            },
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
