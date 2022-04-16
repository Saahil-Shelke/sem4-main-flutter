import 'package:attendance_system/homeScreen.dart';
import 'package:attendance_system/loginscreenmanager.dart';
import 'package:attendance_system/role.dart';
import 'package:attendance_system/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/auth_services.dart';
import 'package:attendance_system/loginscreenemployee.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // return MultiProvider(
    //   providers: [
    //     Provider<AuthService> (
    //       create: (_) => AuthService(FirebaseAuth.instance),
    //     ),
    //     StreamProvider(
    //         create: (context) => context.read(),
    //     ),
    //   ],
      return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home : const KeyboardVisibilityProvider (
          child : AuthCheck(),
            ),
        // home : HomeScreen(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();

    _getCurrentUser();
  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if(sharedPreferences.getString('employeeId') != null) {
        setState(() {
          userAvailable = true;
        });
      }
    } catch(e) {
      setState(() {
        userAvailable = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return userAvailable ? const HomeScreen() : const LoginScreenEmployee();
  }
}



// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//
//     if(firebaseUser != null) {
//       return Text("Signed in");
//     }
//     return Text("Not signed in");
//   }
// }
//
//

