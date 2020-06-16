import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplechat/widgets/appbar.dart';
import 'package:simplechat/pages/login/signup.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10,),
              TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54)
                  )
                ),
              ),
              TextField(
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54)
                    )
                ),
                obscureText: true,
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blueAccent
                    ]
                  )
                ),
                child: Center(
                  child: Text('Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white
                ),
                child: Center(
                  child: Text('Sign In with Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignUp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have account? " ,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text("Join now!",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
