import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplechat/model/user.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFirebase(FirebaseUser user){
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInWithEmailPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFirebase(firebaseUser);
    } catch(e){
      print(e);
    }
  }

  Future signUpWithEmailPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword
        (email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFirebase(firebaseUser);
    } catch(e){
      print(e);
    }
  }

  Future resetPasword(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e){
      print(e.toString());
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e);
    }
  }
}