import 'package:attendance_system/todayscreen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/loginscreenmanager.dart';
import 'main.dart';
import 'package:attendance_system/signUp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
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
                "Employee",
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
              decoration: BoxDecoration (
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
                              "10:00",
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
                              "06:00",
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
            Container (
              alignment: Alignment.centerLeft,
              child: Text(
                "8 : 00 Hrs",
                style: TextStyle (
                  fontFamily : "IBMPlexSens-Bold",
                  fontSize: screenWidth/20,
                  color: Colors.black54
                ),
              ),
            ),
            Container (
              alignment: Alignment.centerLeft,
              child: Text(
                "15 April 2020",
                style: TextStyle (
                    fontFamily : "IBMPlexSens-Bold",
                    fontSize: screenWidth/20,
                    color: Colors.black87,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text : "Slide to Check Out",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth/20,
                      fontFamily: "IBMPlexSens-Regular",
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key : key,
                    onSubmit: () {
                        key.currentState!.reset();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
