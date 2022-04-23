import 'dart:async';

import 'package:attendance_system/temp2.dart';
import 'package:attendance_system/todayscreen.dart';
import 'package:attendance_system/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/loginscreenmanager.dart';
import 'package:attendance_system/loginscreenemployee.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'package:attendance_system/signUp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:attendance_system/user.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  String checkIn = "--/--";
  String checkOut = "--/--";

  Color primary = const Color(0xffeef444c);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRecord();
  }

  void _getRecord() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .where('id', isEqualTo: User.username)
          .get();

      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("Employee")
          .doc (snap.docs[0].id)
          .collection("Record")
          .doc (DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();

      setState(() {
        checkIn = snap2['checkIn'];
        checkOut = snap2['checkOut'];
      });

    }
    catch(e) {
        checkIn = "--/--";
        checkOut = "--/--";
    }

    print(checkIn);
    print(checkOut);
  }


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body : SingleChildScrollView (
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container (
              alignment : Alignment.centerLeft,
              margin: const EdgeInsets.only(top : 32),
              child: Text (
                "Welcome",
                style: TextStyle(
                  color : Colors.black54,
                  fontFamily: "IBMPlexSans-Regular",
                  fontSize: screenWidth/26,
                ),
              ),
            ),
            Container (
              alignment : Alignment.centerLeft,
              margin: const EdgeInsets.only(top : 32),
              child: Text (
                "Employee" + User.username,
                style: TextStyle(
                  fontFamily: "IBMPlexSans-Bold",
                  fontSize: screenWidth/18,
                ),
              ),
            ),
            Container (
              alignment : Alignment.centerLeft,
              margin: const EdgeInsets.only(top : 32),
              child: Text (
                "Today's Status",
                style: TextStyle(
                  fontFamily: "IBMPlexSans-Bold",
                  fontSize: screenWidth/18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top : 12 , bottom: 32),
              height: 150,
              decoration: const BoxDecoration (
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color : Colors.black26,
                    blurRadius : 10,
                    offset : Offset(2,2,),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container (
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Check In",
                              style: TextStyle(
                                fontFamily: "IBMPlexSens-Regular",
                                fontSize: screenWidth/20,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              checkIn,
                              style: TextStyle(
                              fontFamily: "IBMPlexSens-Bold",
                              fontSize: screenWidth/18,
                            ),
                            ),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    child: Container (
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Check Out",
                              style: TextStyle(
                                fontFamily: "IBMPlexSens-Regular",
                                fontSize: screenWidth/20,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              checkOut,
                              style: TextStyle(
                                fontFamily: "IBMPlexSens-Bold",
                                fontSize: screenWidth/18,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context,snapshot) {
              return Container (
              alignment: Alignment.centerLeft,
              child: Text(
              DateFormat('hh:mm:ss a').format(DateTime.now()),
              style: TextStyle (
              fontFamily : "IBMPlexSens-Bold",
              fontSize: screenWidth/20,
              color: Colors.black54
              ),
              ),
              );
              }
              ),
            Container (
              alignment: Alignment.centerLeft,
    child: RichText(
    text: TextSpan(
    text: DateTime.now().day.toString(),
    style: TextStyle(
    color: primary,
    fontSize: screenWidth / 18,
    fontFamily: "IBMPlexSans-Bold",
    ),
    children: [
    TextSpan(
    text: DateFormat(' MMMM yyyy').format(DateTime.now()),
    style: TextStyle(
    color: Colors.black,
    fontSize: screenWidth / 20,
    fontFamily: "IBMPlexSans-Bold",
    )
    )
    ]
    ),
    )
    ),
    // GestureDetector(
    // onTap: () async {
    //   print(DateFormat('hh:mm').format(DateTime.now()));
    //
    //   QuerySnapshot snap = await FirebaseFirestore.instance
    //       .collection("Employee")
    //       .where('id', isEqualTo: User.username)
    //       .get();
    //
    //   print(snap.docs[0].id);
    //   print(DateFormat('dd MMMM yyyy').format (DateTime.now()));
    //
    //   DocumentSnapshot snap2 = await FirebaseFirestore.instance
    //       .collection("Employee")
    //       .doc (snap.docs[0].id)
    //       .collection("Record")
    //       .doc (DateFormat('dd MMMM yyyy').format(DateTime.now()))
    //       .get();
    //
    //
    //
    //   try {
    //     String checkIn = snap2['checkIn'];
    //     await FirebaseFirestore.instance
    //         .collection("Employee")
    //         .doc (snap.docs[0].id)
    //         .collection("Record")
    //         .doc (DateFormat('dd MMMM yyyy').format (DateTime.now()))
    //         .update({
    //       'checkIn' : checkIn,
    //       'checkOut': DateFormat('hh:mm').format(
    //           DateTime.now()),
    //     });
    //   } catch (e) {
    //     await FirebaseFirestore.instance
    //         .collection("Employee")
    //         .doc (snap.docs[0].id)
    //         .collection("Record")
    //         .doc (DateFormat('dd MMMM yyyy').format (DateTime.now()))
    //         .set({
    //       'checkIn': DateFormat('hh:mm').format (DateTime.now()),
    //     });
    //   }
    // }

      // child: Container(
      // height: 60,
      // width: screenWidth,
      // margin: EdgeInsets.only(
      //     top: screenHeight / 40, bottom: screenHeight / 40),
      // decoration: BoxDecoration(
      //   color: primary,
      //   borderRadius: const BorderRadius.all(Radius.circular(30)),
      // ),
      // // child: GestureDetector(
      // //   onTap : () {
      // //     Navigator.push(context,MaterialPageRoute(
      // //         builder: (context) => SignUp()));
      // //   },
      // child : Center(
      //   child: Text(
      //     "LOGIN",
      //     style: TextStyle(
      //       fontFamily: "IBMPlexSens-Bold",
      //       fontSize: screenWidth / 26,
      //       color: Colors.white,
      //       letterSpacing: 1.8,
      //     ),
      //   ),
      // ),

            checkOut == "--/--" ? Container(
              margin: const EdgeInsets.only(top: 20),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text: checkIn == "--/--" ? "Slide to Check In" : "Slide to Check Out",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 20,
                      fontFamily: "IBMPlexSens-Regular",
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key: key,
                    onSubmit: () async {
                      Timer(Duration(seconds : 1), () {
                        key.currentState!.reset();
                      });
                      // Reg x = Reg("Ronak","11.34" );
                      // x.addUser(context);
                      // String id = idCon.text.trim();
                      print(DateFormat('hh:mm').format(DateTime.now()));

                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection("Employee")
                          .where('id', isEqualTo: User.username)
                          .get();

                      DocumentSnapshot snap2 = await FirebaseFirestore.instance
                          .collection("Employee")
                          .doc (snap.docs[0].id)
                          .collection("Record")
                          .doc (DateFormat('dd MMMM yyyy').format(DateTime.now()))
                          .get();

                          try {
                          String checkIn = snap2['checkIn'];

                          setState(() {
                            checkOut = DateFormat('hh : mm').format(DateTime.now());
                          });

                            await FirebaseFirestore.instance
                            .collection("Employee")
                            .doc(snap.docs[0].id)
                            .collection("Record")
                            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                            .update({
                          'checkIn': checkIn,
                          'checkOut': DateFormat('hh:mm').format(
                              DateTime.now()),
                        });
                      } catch (e) {

                            setState(() {
                              checkIn = DateFormat('hh : mm').format(DateTime.now());
                            });

                        await FirebaseFirestore.instance
                            .collection("Employee")
                            .doc(snap.docs[0].id)
                            .collection("Record")
                            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                            .set({
                          'checkIn': DateFormat('hh:mm').format(DateTime.now()),
                        });
                      }
                    },
                  );
                },
    ),
            ) : Container (
              margin : const EdgeInsets.only(top : 32),
              child : Text(
              "You have completed this day! ",
              style: TextStyle(
                color: Colors.black54,
                fontSize: screenWidth / 20,
                fontFamily: "IBMPlexSens-Regular",
              ),
            ),
            )
        ],
    ),
    ),
    );
  }
}
