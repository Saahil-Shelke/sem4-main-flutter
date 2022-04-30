import 'dart:async';
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

class calendarScreen extends StatefulWidget {
  const calendarScreen({Key? key}) : super(key: key);

  @override
  State<calendarScreen> createState() => _calendarScreenState();
}

class _calendarScreenState extends State<calendarScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body : SingleChildScrollView (
            padding: EdgeInsets.all(20),
          child: Column (
          children : [
          Container (
            alignment : Alignment.centerLeft,
            margin: const EdgeInsets.only(top : 32),
            child: Text (
              "My Attendance",
              style: TextStyle(
                color : Colors.black45,
                fontFamily: "IBMPlexSans-Bold",
                fontSize: screenWidth/18,
              ),
            ),
          ),
            Stack(
              children: [
                Container (
                  alignment : Alignment.centerLeft,
                  margin: const EdgeInsets.only(top : 32),
                  child: Text (
                    "April",
                    style: TextStyle(
                      color : Colors.black87,
                      fontFamily: "IBMPlexSans-Bold",
                      fontSize: screenWidth/18,
                    ),
                  ),
                ),
                Container (
                  alignment : Alignment.centerRight,
                  margin: const EdgeInsets.only(top : 32),
                  child: Text (
                    "Pick a month",
                    style: TextStyle(
                      color : Colors.black87,
                      fontFamily: "IBMPlexSans-Bold",
                      fontSize: screenWidth/18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight - screenHeight/5,
            child: StreamBuilder<QuerySnapshot> (
            stream: FirebaseFirestore.instance.collection("Employee").doc(User.username).collection("Record").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final snap = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top : 12 ,left: 6, right: 6),
                      height: 100,
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
                                      snap[index]['checkIn'],
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
                                      snap[index]['checkOut'],
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
                    );
                  },
                );
              }
              else {
                return const SizedBox();
              }
            },
    ),
            ),
            ],
          )
        )
    );
  }
}
