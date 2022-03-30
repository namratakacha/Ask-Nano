import 'package:ask_nano/common_widgets/button_style_common.dart';
import 'package:ask_nano/common_widgets/text_button_common.dart';
import 'package:ask_nano/screens/bottom_navigation_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? codeNumber = '+233';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passwordVisible = false;
  DateTime selectedDate = DateTime.now();
  bool isAccepted = false;

  void _onCountryChange(CountryCode countryCode) {
    codeNumber = countryCode.toString();
    //print("New Country selected: " + countryCode.toString());
  }

  @override
  void initState() {
    dateController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20,0),
                child: Text(
                  'Welcome to AskNano',
                  style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      color: Colors.grey.shade800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20,0),
                child: TextFormField(
                  controller: nameController,
                  cursorColor: Color(0xFF130CB7),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter full name';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
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
                padding: const EdgeInsets.fromLTRB(0, 20, 20,0),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    '*For Ghana Residential users, select country code either 233 or 0 and then directly enter your rest mobile number digits in the Field.'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailController,
                  cursorColor: Color(0xFF130CB7),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email(optional)',
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
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
                    hintText: 'Set password',
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
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
                child: TextFormField(
                  controller: dateController,
                  cursorColor: Color(0xFF130CB7),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Date of birth',
                      hintStyle: TextStyle(fontSize: 13),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF130CB7),
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate);
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    }
                  },
                ),
              ),
              GenderSelector(),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Row(
                  children: [
                    Checkbox(
                        value: isAccepted,
                        side: BorderSide(color: Color(0xFF130CB7)),
                        activeColor: Color(0xFF130CB7),
                        onChanged: (value){
                          setState(() {
                            isAccepted = value ?? false;
                          });

                        }),
                    Text('Accept'),
                    TextButtonWidget(title: 'Terms & Conditions', onPressed: (){}, fontSize: 12),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonWidget(title: 'Register', onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: _gender.isSelected
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF130CB7),
                  Color(0xFF52E5E7),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 6,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: Colors.grey.withOpacity(0.8))
            ),
      margin: new EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            _gender.icon,
            color: _gender.isSelected ? Colors.white : Colors.grey,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            _gender.name,
            style: TextStyle(
                color: _gender.isSelected ? Colors.white : Colors.grey),
          )
        ],
      ),
    );
  }
}

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = [
    Gender("Male", Icons.male, true),
    Gender("Female", Icons.female, false)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: genders.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    genders.forEach((gender) => gender.isSelected = false);
                    genders[index].isSelected = true;
                  });
                },
                child: CustomRadio(genders[index]),
              );
            }),
      ),
    );
  }
}
