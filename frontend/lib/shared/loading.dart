import 'dart:async';

import 'package:better_in_blocks/screens/login.dart';
import 'package:better_in_blocks/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Register())));
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
              'Getting your info',
              style: TextStyle(
                  color: Colors.grey[700], fontFamily: 'Cavier', fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
