import 'package:flutter/material.dart';
import 'package:simplechat/pages/login/login.dart';
import 'package:simplechat/service/auth.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {

  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat room'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LoginScreen()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
    );
  }
}
