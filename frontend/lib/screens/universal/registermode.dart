import 'package:flutter/gestures.dart';

/// Flutter code sample for LinearGradient

// This sample draws a picture that looks like vertical window shades by having
// a [Container] display a [BoxDecoration] with a [LinearGradient].

import 'package:flutter/material.dart';
import 'package:frontend/screens/universal/studentreg.dart';
import 'package:frontend/screens/universal/university_register.dart';
import 'package:frontend/auth/verify.dart';

import 'login.dart';

/// This is the stateless widget that the main application instantiates.
class RegMode extends StatefulWidget {
  RegMode({Key key}) : super(key: key);

  @override
  _RegModeWidgetState createState() => _RegModeWidgetState();
}

class _RegModeWidgetState extends State<RegMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xff6DD5FA),
              const Color(0xff1FA2FF),
              const Color(0xffA6FFCB)
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
      ),
      Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(100, 70, 50, 0),
              child: Image.asset(
                "asset/images/logo_splash.png",
                width: 205,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80, 10, 50, 50),
              child: Text(
                'Better in Blocks',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Caiver',
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(40, 225, 40, 0),
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height / 2.7,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Register As",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "Cavier",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue[700],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                            child: Text(
                              "Student",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Cavier',
                                  //fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Register()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green[700],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                            child: Text(
                              "University",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Cavier',
                                  //fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          University()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Have an Account ? Login Instead',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Login()));
                                  // print('Terms of Service"');
                                }),
                        )
                      ]))
                ])
              ]))
    ]));
  }
}
