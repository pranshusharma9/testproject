import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpmg/Login.dart';
import 'package:kpmg/Welcome.dart';
import 'package:kpmg/widget/device_utils.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'Signup.dart';
import 'NavBar_Login.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

var name;

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 48, 135),
        centerTitle: true,
        title: Text('ACCOUNT CREATED'),
      ),
      drawer: NavBar(),
      body: successpage(),
    );
  }
}

class successpage extends StatefulWidget {
  const successpage({Key? key}) : super(key: key);

  @override
  State<successpage> createState() => _successpageState();
}

class _successpageState extends State<successpage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  bool validate = false;

  bool _isObscure = true; //To hide password
  final _formKey = GlobalKey<FormState>();
  var name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          //KPMG_LOGO
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
              child: Image(
                  height: 300,
                  width: 400,
                  image: AssetImage('assets/Done-rafiki.png'))),

          /*Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                          text: 'New account create!',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 48, 135)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),*/

          //LOGIN Button
          Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: ElevatedButton(
                  child: const Text(
                    'Login to continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      primary: Color(0xff3249ab),
                      minimumSize: Size.fromHeight(40)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  })),
        ],
      ),
    );
  }
}
