import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              icon: Icon(Icons.arrow_back),
              color: Colors.grey.shade800,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'Enter OTP',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
              child: TextFormField(
                controller: otpController,
                cursorColor: Color(0xFF130CB7),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                      return 'Please enter OTP';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'One time password',
                  hintStyle: TextStyle(fontSize: 16),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF130CB7),
                    ),
                  ),
                  suffixIcon: Icon(Icons.refresh, color: Color(0xFF130CB7), size: 30,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
              child: ButtonWidget(title: 'DONE', onpressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                }
              }),
            ),
          ],
        ),
      ),

    );
  }
}
