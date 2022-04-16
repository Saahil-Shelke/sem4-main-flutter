// import 'main.dart';
// import 'package:flutter/material.dart';
//
// class Role extends StatefulWidget {
//   const Role({Key? key}) : super(key: key);
//
//   @override
//   State<Role> createState() => _RoleState();
// }
//
// class _RoleState extends State<Role> {
//
//   double screenHeight = 0;
//   double screenWidth = 0;
//
//   Color primary = const Color(0xffeef444c);
//
//   @override
//   Widget build(BuildContext context) {
//
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//
//     final managerLogo = Hero(
//       tag: 'manager-logo',
//       child: CircleAvatar(
//         child: Container(
//             width: 150.0,
//             height: 150.0,
//             decoration: BoxDecoration(
//               color: primary ,
//               image: DecorationImage(
//                 image: AssetImage("assets/images/14-148399_employee-clipart.png"),
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(80.0)),
//             )),
//       ),
//     );
//
//     final studentLogo = Hero(
//       tag: 'student-logo',
//       child: CircleAvatar(
//         child: Container(
//           width: 150.0,
//           height: 150.0,
//           decoration: BoxDecoration(
//             color: primary,
//             image: DecorationImage(
//               image: AssetImage("assets/images/manager-1.png"),
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(80.0)),
//           ),
//         ),
//       ),
//     );
//
//     return new Scaffold(
//       appBar: new MyAppBar().createAppbar("Attendee"),
//       body: new Builder(
//         builder: (BuildContext context) {
//           _scaffoldContext = context;
//
//           return new Container(
//             decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: const Alignment(1.0, 5.0),
//                 // 10% of the width, so there are ten blinds.
//                 colors: [Colors.white, Colors.blueAccent], // whitish to gray
//               ),
//             ),
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 new Column(
//                   children: <Widget>[
//                     new Container(
//                       width: 150.0,
//                       height: 150.0,
//                       child: professorLogo,
//                       margin: const EdgeInsets.all(16.0),
//                     ),
//                   ],
//                 ),
//                 new Container(
//                   child: new RaisedButton(
//                     padding: const EdgeInsets.all(16.0),
//                     color: primary,
//                     elevation: 20.0,
//                     onPressed: () {
//                       LoginScreen();
//                     },
//                     child: new Text("I am Professor", style: btnLable),
//                     shape: new RoundedRectangleBorder(
//                         borderRadius:
//                         new BorderRadius.all(const Radius.circular(60.0))),
//                   ),
//                   margin: const EdgeInsets.only(
//                       bottom: 16.0, left: 16.0, right: 16.0),
//                 ),
//                 new Column(
//                   children: <Widget>[
//                     new Container(
//                       width: 150.0,
//                       height: 150.0,
//                       child: studentLogo,
//                       margin: const EdgeInsets.all(16.0),
//                     ),
//                   ],
//                 ),
//                 new Container(
//                   child: new RaisedButton(
//                     padding: const EdgeInsets.all(16.0),
//                     color: Colors.blueAccent,
//                     elevation: 20.0,
//                     onPressed: () {
//                       openStudentLoginPage();
//                     },
//                     child: new Text("I am Student", style: btnLable),
//                     shape: new RoundedRectangleBorder(
//                         borderRadius:
//                         new BorderRadius.all(const Radius.circular(60.0))),
//                   ),
//                   margin: const EdgeInsets.only(
//                       bottom: 16.0, left: 16.0, right: 16.0),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
