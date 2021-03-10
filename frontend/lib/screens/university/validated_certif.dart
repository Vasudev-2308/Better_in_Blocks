import 'package:flutter/material.dart';

class ValidatedCertif extends StatefulWidget {
  @override
  _ValidatedCertifState createState() => _ValidatedCertifState();
}

class _ValidatedCertifState extends State<ValidatedCertif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      body: Stack(fit: StackFit.expand, children: [
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xffF2F2F2),
              const Color(0xffEAEAEA),
              const Color(0xffffffff)
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        )),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                "Certificates Validated",
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
