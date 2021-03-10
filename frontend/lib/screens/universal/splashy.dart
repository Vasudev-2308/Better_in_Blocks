import 'package:frontend/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'login.dart';
import 'package:splash_screen_view/TyperAnimatedText.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: SplashScreenView(
            home: Loading(),
            duration: 3500,
            imageSize: 200,
            imageSrc: "asset/images/logo_splash.png",
            text: "Better in Blocks",
            textType: TextType.TyperAnimatedText,
            textStyle: TextStyle(
                fontSize: 30.0,
                fontFamily: 'KaushanScript',
                fontWeight: FontWeight.bold),
            backgroundColor: Colors.blue[200],
          ),
        ));
  }
}
