import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/common_widgets/text_button_common.dart';
import 'package:ask_nano/screens/forgot_password.dart';
import 'package:ask_nano/screens/bottom_navigation_screen.dart';
import 'package:ask_nano/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_code_picker/country_code_picker.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int? groupValue = 0;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? codeNumber = '+233';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passwordVisible = false;

  // bool isValidate = true;

  void _onCountryChange(CountryCode countryCode) {
    codeNumber = countryCode.toString();
    //print("New Country selected: " + countryCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade800),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          width: double.infinity,
                          child: CupertinoSlidingSegmentedControl<int>(
                            backgroundColor: Color(0xFF130CB7),
                            thumbColor: Colors.white,
                            groupValue: groupValue,
                            children: {
                              0: mobileSegment("Login with mobile"),
                              1: emailSegment("Login with email"),
                            },
                            onValueChanged: (value) {
                              setState(() {
                                groupValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: groupValue == 0 ? mobileLogin() : emailLogin(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
            child: buildPassword(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Color(0xFF130CB7),
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontSize: 13),
                ),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 30, 23, 15),
            child: ButtonWidget(
              title: 'LOGIN',
              onpressed: () {
                // if (_formKey.currentState!.validate()) {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                // }
              },
              width: double.infinity,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New user?',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 14, color: Colors.grey),
              ),
              TextButtonWidget(
                title: 'Register',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                fontSize: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 20, 27, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade700,
                    height: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text('Login with',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF130CB7),
                          fontFamily: 'Poppins',
                         )),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade700,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/icons/ic_logo_facebook.PNG'),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset('assets/icons/google-plus.png')),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  mobileSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: groupValue == 1 ? Colors.white : Colors.black,
            decoration: TextDecoration.none),
      ),
    );
  }

  emailSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: groupValue == 0 ? Colors.white : Colors.black,
            decoration: TextDecoration.none),
      ),
    );
  }

  mobileLogin() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 25, left: 8),
            child: Visibility(
              visible: groupValue == 0 ? true : false,
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
                          return 'Please enter Mobile number';
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
              '*For Ghana Residential users, select country code either 233 or 0 and then directly enter your rest mobile number digits in the Field.'),
        ),
      ],
    );
  }

  emailLogin() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
          child: TextFormField(
            controller: emailController,
            cursorColor: Color(0xFF130CB7),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Email';
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
      ],
    );
  }

  buildPassword() {
    return TextFormField(
      controller: passwordController,
      obscureText: _passwordVisible ? false : true,
      cursorColor: Color(0xFF130CB7),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter Password';
        }
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF130CB7))),
        hintText: 'Password',
        hintStyle: TextStyle(fontSize: 13),
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
