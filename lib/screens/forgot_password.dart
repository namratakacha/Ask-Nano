import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/screens/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? codeNumber = '+233';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onCountryChange(CountryCode countryCode) {
    codeNumber = countryCode.toString();
    //print("New Country selected: " + countryCode.toString());
  }

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
          )),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 25),
              child: Text(
                'Welcome back',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 25),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CountryCodePicker(
                      onChanged: _onCountryChange,
                      initialSelection: 'GH',
                      favorite: ['+233', 'GH'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      showDropDownButton: true,
                      showFlag: true,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: phoneController,
                      cursorColor: Color(0xFF130CB7),
                      validator: (value) {
                        if (value!.isEmpty) {
                          if(emailController.text.isEmpty){
                            return 'Please enter Mobile number';
                          }
                        } else if (value.length < 10) {
                          return 'Please enter valid mobile number';
                        } else if (value.length > 10) {
                          return 'Please enter valid mobile number';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                        hintStyle: TextStyle(fontSize: 13),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF130CB7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                  '*For Ghana Residential users, select country code either 233 or 0 and then directly enter your rest mobile number digits in the Field.'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xFF130CB7),
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text('OR',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF130CB7),
                          fontFamily: 'Poppins',
                        )),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xFF130CB7),
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
              child: TextFormField(
                controller: emailController,
                cursorColor: Color(0xFF130CB7),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    if(phoneController.text.isEmpty){
                      return 'Please enter Email';
                    }
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 13),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF130CB7),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, right: 10),
              child: Text(
                  '*If you forgot password of your support channel, then please enter email address and contact Business owner for OTP to reset the password'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 70, right: 25),
              child: ButtonWidget(
                title: 'SUBMIT',
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    if(emailController.text.isNotEmpty){
                      dialogBox();
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                    }

                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  dialogBox() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          width: 70,
                          child:
                              Image.asset('assets/icons/ic_mail_password.PNG'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40, left: 60),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.clear)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "We'll send you the reset password link to your registered mail ID",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              titlePadding: EdgeInsets.only(top: 10),
              titleTextStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Colors.grey.shade800),
              content: Text(
                'Are you sure want to proceed?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600),
              ),
              contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'NO',
                              style: TextStyle(color: Color(0xFF130CB7)),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
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
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              if (phoneController.text.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen()));
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'YES',
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
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
