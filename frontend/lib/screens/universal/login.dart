import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_auth/email_auth.dart';
import 'package:frontend/screens/universal/studentreg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/universal/registermode.dart';
import 'package:frontend/auth/verify.dart';
import 'package:frontend/shared/load2init.dart';
import 'package:frontend/shared/load2otp.dart';
import 'package:frontend/shared/otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController username_Controller = new TextEditingController();
  TextEditingController password_Controller = new TextEditingController();

  void sendOtp() async {
    EmailAuth.sessionName = "Validate User";
    var res = EmailAuth.sendOtp(receiverMail: username_Controller.text);
    if (res != null) {
      print("true");
    }
  }

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
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
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
                padding: EdgeInsets.fromLTRB(40, 250, 40, 0),
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
                        height: MediaQuery.of(context).size.height / 2.3,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Login",
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
                                        labelText: 'Email',
                                      ))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                child: TextFormField(
                                    controller: password_Controller,
                                    obscureText: obscure,
                                    //scrollPadding: EdgeInsets.only(left: 10),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: new Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey[600],
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscure = !obscure;
                                            });
                                          },
                                        )))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
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
                              child: TextButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    final String username =
                                        username_Controller.text;
                                    final String password =
                                        password_Controller.text;
                                    auth.signInWithEmailAndPassword(
                                        email: username, password: password);
                                    sendOtp();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Load2Init()));
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Dont Have an Account ? Register',
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
                                                  RegMode()));
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
