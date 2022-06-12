import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpmg/Login.dart';
import 'package:kpmg/Signup_Successful.dart';
import 'package:kpmg/Welcome.dart';
import './NavBar_SignUp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kpmg/widget/device_utils.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 48, 135),
        centerTitle: true,
        title: Text('SIGN UP'),
      ),
      body: Formm(),
      drawer: NavBar(),
    );
  }
}

class Formm extends StatefulWidget {
  const Formm({Key? key}) : super(key: key);

  @override
  State<Formm> createState() => _FormmState();
}

class _FormmState extends State<Formm> {
  final controllerfullname = TextEditingController();
  final controllerEmai = TextEditingController();
  final controllerEmpoyeeid = TextEditingController();
  final controllerPhonenumber = TextEditingController();
  final controllerCreatePassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String encodedImage = "";
  var pass;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
      child: Form(
        key: _formkey,
        //_formkey.currentState!.validate(),
        child: ListView(
          children: [
            //Text(""),

            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: TextFormField(
                  controller: controllerfullname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    alignLabelWithHint: true,

                    hintText: "Full Name",
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 240, 240, 240),

                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 240, 240, 240)),
                        borderRadius: BorderRadius.circular(6)),
                  )),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: TextFormField(
                  controller: controllerEmai,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    alignLabelWithHint: true,

                    hintText: "KPMG E-mail ID",
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 240, 240, 240),

                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 240, 240, 240)),
                        borderRadius: BorderRadius.circular(6)),
                  )),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: TextFormField(
                  controller: controllerEmpoyeeid,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card),
                    alignLabelWithHint: true,

                    hintText: "Employee ID",
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 240, 240, 240),

                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 240, 240, 240)),
                        borderRadius: BorderRadius.circular(6)),
                  )),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: IntlPhoneField(
                controller: controllerPhonenumber,
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  //labelText: 'Phone Number',
                  hintText: 'XXXXXXXXXX',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                      borderRadius: BorderRadius.circular(6)),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),

            // IntlPhoneField(
            //   initialCountryCode: 'IN',
            //   decoration: InputDecoration(
            //     labelText: 'Phone Number',
            //     //labelStyle: TextStyle(fontSize: 16, height: 0.5),
            //     hintText: "XXXXXXXXXX",
            //     //hintStyle: TextStyle(fontSize: 16, height: 1),

            //     // border: OutlineInputBorder(
            //     //   borderSide: BorderSide(),
            //     // ),
            //   ),
            //   onChanged: (phone) {
            //     print(phone.completeNumber);
            //   },
            //   onCountryChanged: (country) {
            //     print('Country changed to: ' + country.name);
            //   },
            // ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: TextFormField(
                controller: controllerCreatePassword,
                //pass = controllerUsername.text.trim();
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
                obscureText: _isObscure,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  alignLabelWithHint: true,

                  hintText: "Create Password",

                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 240, 240, 240),

                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: TextFormField(
                controller: controllerConfirmPassword,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Empty';
                  }
                  if (controllerConfirmPassword.text !=
                      controllerCreatePassword.text) {
                    return 'Password Do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  alignLabelWithHint: true,

                  hintText: "Confirm Password",

                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 240, 240, 240),

                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
                height: 50,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        primary: Color.fromARGB(255, 29, 169, 43),
                        minimumSize: Size.fromHeight(40)),
                    child: const Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (_canSignUp()) {
                          DeviceUtils.hideKeyboard(context);
                          doUserRegistration();
                        } else {
                          _showErrorMessage(
                              'Please fill in all fields', context);
                        }
                      } else {
                        print("Unsuccessful");
                      }
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 48, 135),
                        fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSuccess(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorMessage(String message, BuildContext context) {
    if (message.isNotEmpty) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool _canSignUp() {
    var fullname = controllerfullname.text.trim();
    var emai = controllerEmai.text.trim();
    var id = controllerEmpoyeeid.text.trim();
    var phone = controllerPhonenumber.text.trim();
    var createpassword = controllerCreatePassword.text.trim();
    var confirmpassword = controllerConfirmPassword.text.trim();
    if (fullname.length == 0 ||
        emai.length == 0 ||
        id.length == 0 ||
        phone.length == 0 ||
        createpassword.length == 0 ||
        confirmpassword.length == 0) {
      return false;
    }
    return true;
  }

  void doUserRegistration() async {
    final fullname = controllerfullname.text.trim();
    final emai = controllerEmai.text.trim();
    final id = controllerEmpoyeeid.text.trim();
    final phone = controllerPhonenumber.text.trim();
    final createpassword = controllerCreatePassword.text.trim();
    final confirmpassword = controllerConfirmPassword.text.trim();

    var user = ParseUser.createUser(fullname, createpassword, emai);
    user
      ..set("EmpId", id)
      ..set("Phone", phone);

    var response = await user.save();
    if (response.success) {
      // AlertDialog(
      //   title: const Text('Successfull'),
      //   content: Text("User created successfull"),
      //   actions: <Widget>[
      //     TextButton(
      //       child: const Text('Ok'),
      //       onPressed: () {
      //         _navigateToNextScreen(context);
      //       },
      //     ),
      //   ],
      // );
      _navigateToNextScreen(context);
      print("User created");
    } else {
      _showErrorMessage(response.error!.message, context);
    }
  }

  void _backPressed() {
    Navigator.of(context).pop();
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Success()));
  }
}
