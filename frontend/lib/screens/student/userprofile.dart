import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/universal/login.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
  }

  void signOut() async {
    auth.signOut().then((value) => () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Login()));
        });
  }

  // userValue() async {
  //   return StreamBuilder(
  //       stream: FirebaseFirestore.instance.collection('student').snapshots(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //             padding: const EdgeInsets.all(10.0),
  //             itemBuilder: (BuildContext context, int index) =>
  //                 Text(snapshot.data.docs[index]['uid']),
  //             itemCount: snapshot.data.docs.length,
  //           );
  //         } else {
  //           return ListView(
  //             children: snapshot.data.docs.map((document) {
  //               return Container(
  //                 child: Center(child: Text(document['username'])),
  //               );
  //             }).toList(),
  //           );
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.blue[100]
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
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Text(
                "User",
                style: TextStyle(
                    fontFamily: 'Cavier',
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Harshil",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )
      ]),
    );
  }
}
