import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  Future<bool> singup({
    required String email,
    required String password,
  }) async {
    try{
      UserCredential userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseFirestore.instance.collection("Users").doc(userCred.user!.uid).set(
        {
        'uid': userCred.user!.uid,
        'email': email,
        }
      );

      return true;
    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'weak-password'){
        message = 'Password is to weak';
      } else if (e.code == 'email-already-in-use'){
        message = 'An account already has this email';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor:  Color.fromARGB(100, 0, 0, 0),
        fontSize: 14,
      );
      return false;
    }
  }
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try{
      UserCredential userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseFirestore.instance.collection("Users").doc(userCred.user!.uid).set(
        {
        'uid': userCred.user!.uid,
        'email': email,
        }
      );

      return true;
    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'wrong-password'){
        message = 'Password was incorrect';
      } else if (e.code == 'user-not-found'){
        message = 'No user with that email';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor:  Color.fromARGB(100, 0, 0, 0),
        fontSize: 14,
      );
      return false;
    }
  }
  Future<void> logout() async{
    return await FirebaseAuth.instance.signOut();
  }
}