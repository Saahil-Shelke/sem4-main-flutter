// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'main.dart';
//
//
// class AuthenticationService (
//   final FirebaseAuth _firebaseAuth;
//
//   AuthenticationService(this._firebaseAuth);
//
//   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
//
//   Future<String?> LogIn({String email, String password}) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return "Logged in";
//     }
//       on FirebaseAuthException catch (e) {
//       return e.message;
//       }
//   }
//
//   Future<String?> SignUp({String email, String password}) async {
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       return 'Signed Up';
//     }
//     on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
// )