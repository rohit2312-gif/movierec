import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Services/Authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Auth a = Auth();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'MOVIEREC',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Email',
                  //   enabled: false,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  //    hoverColor: Colors.green,,

                  //    hoverColor: Colors.green,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Password',
                  //   enabled: false,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  //    hoverColor: Colors.green,,

                  //    hoverColor: Colors.green,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
                child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              // height: 30.0,
              //width: double.infinity,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                // setState((){
                //  print("Pressed");
                await a.otp(context);

                // });

                if (FirebaseAuth.instance!.currentUser != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                } else {}
              },
              child: Text(
                'sign in via OTP',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New to movierec? Sign up now.',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ]),
      ),
    );
  }
}
