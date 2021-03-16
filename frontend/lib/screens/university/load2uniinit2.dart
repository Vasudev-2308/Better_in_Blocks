import 'dart:async';

import 'package:frontend/models/universityDetails.dart';
import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/student/userDetailCollection.dart';
import 'package:frontend/screens/universal/login.dart';
import 'package:frontend/screens/universal/studentreg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/screens/university/uniinit.dart';
import 'package:frontend/screens/university/univDetails.dart';
import 'package:frontend/shared/otp2.dart';

class Load2UniInit2 extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Load2UniInit2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => UniversityInit())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              color: Colors.blueAccent,
              size: 50.0,
              //controller: AnimationController(
              // duration: Duration(milliseconds: 1200))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Creating University Account",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
