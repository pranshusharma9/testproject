import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpmg/Welcome.dart';
import 'package:kpmg/widget/device_utils.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'Signup.dart';
import 'NavBar_Login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

var name;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 48, 135),
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      drawer: NavBar(),
      body: LoginField(),
    );
  }
}

class LoginField extends StatefulWidget {
  const LoginField({Key? key}) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
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
              padding: const EdgeInsets.all(0),
              child: Image(
                  height: 150,
                  width: 200,
                  image: AssetImage('assets/KPMG_logo.png'))),

          Column(
            children: [
              //Employee_ID_TextField
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextFormField(
                  controller: controllerUsername,
                  enabled: !isLoggedIn,
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 240, 240, 240)),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: 'Employee ID'),
                ),
              ),

              //Password TextField
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextFormField(
                  controller: controllerPassword,
                  enabled: !isLoggedIn,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 240, 240, 240)),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: 'Password'),
                ),
              ),

              //LOGIN Button
              Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(15, 18, 15, 5),
                  child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          primary: Color(0xff3249ab),
                          minimumSize: Size.fromHeight(40)),
                      onPressed: () {
                        if (_canLogin()) {
                          DeviceUtils.hideKeyboard(context);
                          _signin(context);
                        } else {
                          showInvalid("Empty Employee ID/Password");
                        }
                      })),

              //Forgot Password Button
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password?',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 1, 66, 186),
                        fontWeight: FontWeight.w500)),
              ),

              //Divider
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Divider(
                  color: Color.fromARGB(255, 135, 135, 135),
                ),
              ),

              //SignUp Button
              Container(
                  margin: EdgeInsets.all(15),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          primary: Color.fromARGB(255, 29, 169, 43),
                          minimumSize: Size.fromHeight(40)),
                      child: const Text(
                        'Create New Account',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      })),
            ],
          ),
        ],
      ),
    );
  }

  bool _canLogin() {
    var email = controllerUsername.text.trim();
    var password = controllerPassword.text.trim();
    if (email.length == 0 || password.length == 0) {
      return false;
    }
    return true;
  }

  void _signin(BuildContext context) async {
    setState(() {
      name = controllerUsername.text.trim();
    });
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('User'));
    parseQuery.whereEqualTo("objectId", username);
    print("objectid  = = ==   $parseQuery");
    final user = ParseUser(username, password, null);

    var response = await user.login();

    setState(() {});
    if (response.success) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new WelcomePage()));
      // navigateToNextScreen(context);
    } else {
      showError("Login failed. Check your credentials");
    }

    void showErrorMessage(String message, BuildContext context) {
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

    Future<void> navigateToNextScreen(BuildContext context) async {
      bool a = await adminCheck();
      if (a == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WelcomePage()));
      } else {
        Text("data");
      }
    }
  }

  void showSuccess(String message) {
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

  void showInvalid(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Empty"),
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

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
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

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!");
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showError(response.error!.message);
    }
  }
}

Future<bool> adminCheck() async {
  ParseUser currentUser = await ParseUser.currentUser() as ParseUser;
  final a = currentUser["isAdmin"];
  return a;
}
