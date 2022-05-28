import 'package:flutter/material.dart';
import 'package:using_sharedpreferences_in_flutter/screens/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences in Flutter',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
