import 'package:flutter/material.dart';
import 'package:kpmg/NewEntry.dart';
import 'Login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'z7wjq0OySZ1f2gT9jZ46ZMgnXnNlRpw1FW2xdTVd';
  const keyClientKey = '7DGZsLAmM6S4fAcca7xPe98XCQ9JAJF2UWHgVUcc';
  const keyParseServerUrl = 'https://parseapi.back4app.com/';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPMG',
      home: Start(),
    );
  }
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Entry();
  }
}
