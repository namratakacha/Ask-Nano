import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  String title;
  final onPressed;
  double fontSize;
  TextButtonWidget({Key? key, required this.title, required this.onPressed, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xFF130CB7),
            fontSize: fontSize,
            fontFamily: 'Poppins'),
      ),
    );
  }
}

