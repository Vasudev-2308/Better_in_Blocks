import 'package:flutter/material.dart';

class CertifAddView extends StatefulWidget {
  @override
  _CertifAddViewState createState() => _CertifAddViewState();
}

class _CertifAddViewState extends State<CertifAddView> {
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
                "Add Certificates",
                style: TextStyle(
                    fontFamily: 'Cavier',
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Add Certificate"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
