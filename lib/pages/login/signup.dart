import 'package:flutter/material.dart';
import 'package:simplechat/pages/home/homepage.dart';
import 'package:simplechat/service/auth.dart';
import 'package:simplechat/widgets/appbar.dart';
import 'package:simplechat/pages/login/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      authMethods.signUpWithEmailPassword(emailController.text,
          passwordController.text).then((val){
            //print("${val.uid}");
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => HomepageScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),) :
      Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10,),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val){
                        return val.isEmpty || val.length < 2 ?
                        "Username must more than 2 character" : null;
                      },
                      controller: usernameController,
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                          hintText: "username",
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
                    TextFormField(
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val) ? null : "Please provide a valid email";
                      },
                      controller: emailController,
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
                    TextFormField(
                      validator: (val){
                        return val.length < 6 ? "Password need to be more than 6 character" : null;
                      },
                      controller: passwordController,
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
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  signMeUp();
                },
                child: Container(
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
                    child: Text('Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
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
                  child: Text('Sign Up with Google',
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
                      builder: (context) => LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account? " ,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    Text("Login now!",
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
