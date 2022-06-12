import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Login.dart';
import 'Signup.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        child: Drawer(
            child: ListView(
          children: [
            Text(""),
            SizedBox(
              height: 70,
              child: DrawerHeader(
                  child: Text("MENU",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, color: Color(0xff3249ab)))),
            ),
            Text(""),
            ListTile(
                leading:
                    Icon(Icons.login, color: Color.fromARGB(255, 0, 48, 135)),
                title: Text('Log In',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()))),
            ListTile(
                leading: Icon(Icons.person_add,
                    color: Color.fromARGB(255, 0, 48, 135)),
                title: Text('Sign Up',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()))),
            ListTile(
                leading:
                    Icon(Icons.add, color: Color.fromARGB(255, 0, 48, 135)),
                title: Text('Add New Entry',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
                onTap: () => null),
            ListTile(
                leading:
                    Icon(Icons.list, color: Color.fromARGB(255, 0, 48, 135)),
                title: Text('Review Past Entries',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
                onTap: () => null),
            ListTile(
              leading:
                  Icon(Icons.share, color: Color.fromARGB(255, 0, 48, 135)),
              title: Text('Share',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
            ),
            Divider(),
            ListTile(
              leading:
                  Icon(Icons.settings, color: Color.fromARGB(255, 0, 48, 135)),
              title: Text('Settings',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
              onTap: () => null,
            ),
            ListTile(
              title: Text('Exit',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 48, 135))),
              leading: Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 0, 48, 135)),
              onTap: () => null,
            ),
          ],
        )));
  }
}
