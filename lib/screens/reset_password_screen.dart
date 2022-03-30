import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/common_widgets/text_button_common.dart';
import 'package:ask_nano/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController enterPwController = TextEditingController();
  TextEditingController reEnterPwController = TextEditingController();
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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButtonWidget(
                title: 'Cancel',
                fontSize: 16,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'Set new password',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: buildPassword(
                controller: enterPwController,
                hintText: 'Enter password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: buildPassword(
                controller: reEnterPwController,
                hintText: 'Re-enter password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Re-enter Password';
                  }
                  else if(value != enterPwController.text){
                    return 'Password must be same as above';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
              child: ButtonWidget(
                  title: 'DONE',
                  onpressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            title: Text('Your Password reset successfully!', textAlign: TextAlign.center,),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Color(0xFF130CB7)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(
                                              color: Color(0xFF130CB7), width: 2)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class buildPassword extends StatefulWidget {
  var controller;
  String? hintText;
  var validator;

  buildPassword(
      {Key? key, required this.controller, this.hintText, this.validator})
      : super(key: key);

  @override
  _buildPasswordState createState() => _buildPasswordState();
}

class _buildPasswordState extends State<buildPassword> {
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _passwordVisible ? false : true,
      cursorColor: Color(0xFF130CB7),
      validator: widget.validator,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF130CB7))),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14),
        suffixIcon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return RadialGradient(
              center: Alignment.bottomRight,
              radius: 0.5,
              colors: <Color>[
                Color(0xFF130CB7),
                Color(0xFF52E5E7),
              ],
              tileMode: TileMode.repeated,
            ).createShader(bounds);
          },
          child: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(
                  () {
                    _passwordVisible = !_passwordVisible;
                  },
                );
              }),
        ),
      ),
    );
  }
}
