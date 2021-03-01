import 'package:frontend/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/student/view_certificates.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username_Controller = new TextEditingController();
  TextEditingController password_Controller = new TextEditingController();
  TextEditingController confirm_password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SnackBar(
            content: Text('Undefined Action'),
          );
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,

                    end: Alignment(
                        0.9, 0.0), // 10% of the width, so there are ten blinds.
                    colors: [
                      const Color(0xff12D8FA),
                      const Color(0xff1FA2FF),
                      const Color(0xffA6FFCB),
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
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
                        width: 225,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 50, 50),
                      child: Text(
                        'Better in Blocks',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Caiver',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 250, 30, 0),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Register",
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
                            Form(
                              key: _formKey,
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        new BorderRadius.circular(50.0),
                                  ),
                                  child: TextFormField(
                                      controller: username_Controller,
                                      //scrollPadding: EdgeInsets.only(left: 10),
                                      decoration: InputDecoration(
                                        //alignLabelWithHint: true,
                                        border: InputBorder.none,
                                        labelText: 'Email or Phone Number',
                                      ))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                child: TextFormField(
                                    controller: password_Controller,
                                    obscureText: true,
                                    //scrollPadding: EdgeInsets.only(left: 10),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Password',
                                    ))),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                child: TextFormField(
                                    controller: confirm_password,
                                    obscureText: true,
                                    //scrollPadding: EdgeInsets.only(left: 10),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Confirm Password',
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.blue),
                              child: FlatButton(
                                child: Text("Register"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    final String username =
                                        username_Controller.text;
                                    final String password =
                                        password_Controller.text;
                                    final String verify = confirm_password.text;

                                    if (username.isNotEmpty &&
                                        password == verify) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  InitScreen()));
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Have an Account ? Login',
                                  style: TextStyle(
                                      color: Colors.blue[700],
                                      fontSize: 18,
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
                          ],
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
