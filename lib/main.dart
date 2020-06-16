import 'package:flutter/material.dart';
import 'package:simplechat/pages/home/homepage.dart';
import 'package:simplechat/pages/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xff1F1F1F)
      ),
      home: LoginScreen(),
    );
  }
}
