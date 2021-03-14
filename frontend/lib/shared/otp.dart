import 'package:flutter/material.dart';
import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/student/view_certificates.dart';
import 'package:otp_screen/otp_screen.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "123456") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InitScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpScreen.withGradientBackground(
        topColor: Color(0xff36D1DC),
        bottomColor: Color(0xff5B86E5),
        themeColor: Colors.white,
        titleColor: Colors.black,
        otpLength: 6,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        subTitle: "",
        title: "6 Digit OTP sent to your Mail",
        icon: Icon(
          Icons.security,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
