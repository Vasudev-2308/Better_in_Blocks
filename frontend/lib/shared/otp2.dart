import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/student/view_certificates.dart';
import 'package:frontend/screens/universal/load2init.dart';
import 'package:frontend/screens/university/load2uinit.dart';
import 'package:frontend/screens/university/load2uniinit2.dart';
import 'package:frontend/screens/university/univDetails.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:email_auth/email_auth.dart';

class OtpForm2 extends StatefulWidget {
  @override
  _OtpForm2State createState() => _OtpForm2State();
}

class _OtpForm2State extends State<OtpForm2> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      moveToNextScreen(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UnivData()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,

              end: Alignment(
                  0.9, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xffF2F2F2),
                const Color(0xffEAEAEA),
                const Color(0xffffffff)
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Text(
              "A Verification Request has been sent to your mail please Verify",
              style: TextStyle(fontFamily: "Cavier", fontSize: 20),
            ),
          ),
        )
      ]),
    );
  }
}
