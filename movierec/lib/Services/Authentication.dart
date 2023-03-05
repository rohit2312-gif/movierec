import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/Views/Screens/Home_Page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
//import '../../Views/Screens/Login.dart';
//import '../../Model/projects.dart';

class Auth {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future signin(String email, String password) async {}

  Future login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

//     notifyListeners();
    } catch (e) {
      return Future.error(e);
    }
    //   return;
  }

  Future logout() async {
    await _auth.signOut();

//    return;
  }

  String OTP = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  Future otp(BuildContext context) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+919082220918',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';

        // Create a PhoneAuthCredential with the code

        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: Text('Enter SMS Code'),
                content: Container(
                  height: 85,
                  child: Column(children: [
                    TextField(
                      onChanged: (value) {
                        OTP = value;
                      },
                    ),
                  ]),
                ),
                contentPadding: EdgeInsets.all(10),
                actions: <Widget>[
                  GestureDetector(
                    child: Text('Done'),
                    onTap: () async {
                      if (_auth.currentUser != null) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId, smsCode: OTP);
                          await _auth.signInWithCredential(credential);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Home()));
                        } catch (e) {}
                        //  signIn();
                      }
                    },
                  )
                ],
              );
            });

        // Sign the user in (or link) with the credential
        //  await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
