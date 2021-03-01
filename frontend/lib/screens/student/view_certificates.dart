import 'package:flutter/material.dart';
import 'package:frontend/screens/student/add_certif.dart';
import 'package:frontend/screens/student/search.dart';
import 'package:frontend/screens/student/userprofile.dart';

class CertifView extends StatefulWidget {
  @override
  _CertifViewState createState() => _CertifViewState();
}

class _CertifViewState extends State<CertifView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xffEFEFBB),
              const Color(0xffD4D3DD)
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        )),
        Column(
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Text(
                "Certificates",
                style: TextStyle(
                    fontFamily: 'Cavier',
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
