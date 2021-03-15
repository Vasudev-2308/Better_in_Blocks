import 'dart:async';

import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/universal/login.dart';
import 'package:frontend/screens/universal/studentreg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/shared/otp.dart';
import 'package:otp_screen/otp_screen.dart';

class Load2Otp extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Load2Otp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => OtpForm())));
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
              "Validating User",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
