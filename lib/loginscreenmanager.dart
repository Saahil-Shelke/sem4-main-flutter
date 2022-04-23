import 'package:attendance_system/homeScreen.dart';
import 'package:attendance_system/signUpScreen.dart';
import 'package:attendance_system/signUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreenManager extends StatefulWidget {
  const LoginScreenManager({Key? key}) : super(key: key);

  @override
  State<LoginScreenManager> createState() => _LoginScreenManagerState();
}

class _LoginScreenManagerState extends State<LoginScreenManager> {
  double screenHeight = 0;
  double screenWidth = 0;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    final bool _isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(
        context);
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _isKeyboardVisible ? SizedBox() : Container(
            height: screenHeight / 3,
            width: screenWidth,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: screenWidth / 5,
              ),
            ),

          ),
          // GestureDetector(
          // onTap: () async {
          //   String email = emailCon.text.trim();
          //   String password = passCon.text.trim();
          //
          //
          //     if(email.isEmpty) {
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //         content: Text("Email is empty!"),
          //       ));
          //     }
          //     else if(password.isEmpty) {
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //         content: Text("Password is empty!"),
          //       ));
          //   }
          //     else {
          //       QuerySnapshot snap = await FirebaseFirestore.instance.collection("Employee").where("email", isEqualTo: email).get();
          //
          //       print(snap.docs[0]['id']);
          //     }
          //
          // }
          Container( //Login
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 15,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontFamily: "IBMPlexSans-Bold",
                fontSize: screenWidth / 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 15,
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldTitle("Email ID"),
                customFieldEmail("Enter your email address", emailCon, "email"),
                fieldTitle("Password"),
                customFieldPassword("Enter your password", passCon, "lock"),

                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailCon.text.trim(),
                        password: passCon.text.trim()).
                    then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: Container(
                    height: 60,
                    width: screenWidth,
                    margin: EdgeInsets.only(
                        top: screenHeight / 40, bottom: screenHeight / 40),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    // child: GestureDetector(
                    //   onTap : () {
                    //     Navigator.push(context,MaterialPageRoute(
                    //         builder: (context) => SignUp()));
                    //   },
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontFamily: "IBMPlexSens-Bold",
                          fontSize: screenWidth / 26,
                          color: Colors.white,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                ),
                signUpOption(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row signUpOption() {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(
        context);
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.redAccent)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => isKeyboardVisible? SignUp() : LoginScreenManager()));
          },
          child: const Text (
            " Sign Up ",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "IBMPlexSans-Regular",
          fontSize: screenWidth / 26,
        ),
      ),
    );
  }


  Widget customFieldEmail(String hint, TextEditingController controller,
      String pic) {
    return Container( //InputBox1
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container( //Icon1
            width: screenWidth / 6,
            child: Icon(
              pic == "email" ? Icons.email : Icons.lock,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 6),
              child: TextFormField(
                controller: controller,
                obscureText: false,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customFieldPassword(String hint, TextEditingController controller,
      String pic) {
    return Container( //InputBox1
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container( //Icon1
            width: screenWidth / 6,
            child: Icon(
              pic == "email" ? Icons.email : Icons.lock,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 6),
              child: TextFormField(
                controller: controller,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({Key? key}) : super(key: key);
//
//   @override
//   State<AuthWrapper> createState() => _AuthWrapperState();
// }
//
// class _AuthWrapperState extends State<AuthWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

