import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/screens/universal/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/student/initscreen.dart';
import 'package:frontend/screens/student/view_certificates.dart';
import 'package:frontend/screens/universal/load2init.dart';
import 'package:frontend/screens/universal/load2init2.dart';
import 'package:frontend/services/database.dart';
import 'package:frontend/shared/load2otp.dart';
import 'package:frontend/screens/university/load2uinit.dart';
import 'package:frontend/screens/university/load2uniinit2.dart';
import 'package:frontend/shared/otp.dart';

class UnivData extends StatefulWidget {
  @override
  _UnivDataState createState() => _UnivDataState();
}

class _UnivDataState extends State<UnivData> {
  //FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController username_Controller = new TextEditingController();
  TextEditingController phone_Controller = new TextEditingController();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController date_controller = new TextEditingController();
  DateTime currentDate = DateTime.now();
  String date;
  bool obscure = true;
  //bool _isSuccess;
  Future<String> _selectDate() async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    return currentDate.toString();
  }

  void _handleDialogSubmission() {
    var univDetail = <String, dynamic>{
      'universityname': username_Controller.text,
      'universityid': email_controller.text,
      'regdate': date_controller.text,
      'phonenumber': phone_Controller.text
    };
    Database.addInstitute(univDetail);
  }

  @override
  void dispose() {
    username_Controller.dispose();
    phone_Controller.dispose();
    super.dispose();
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
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 50, 50),
                      child: Text(
                        'Better in Blocks',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Caiver',
                          //fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
                        height: MediaQuery.of(context).size.height / 1.9,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "University Details",
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
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: username_Controller,
                                      keyboardType: TextInputType.name,
                                      //scrollPadding: EdgeInsets.only(left: 10),
                                      decoration: InputDecoration(
                                        //alignLabelWithHint: true,
                                        border: InputBorder.none,
                                        labelText: 'University Name',
                                      ))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                child: TextFormField(
                                  maxLength: 12,
                                  keyboardType: TextInputType.name,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter value';
                                    } else if (value.length < 12) {
                                      return 'Please enter University ID';
                                    }
                                    return null;
                                  },
                                  controller: email_controller,
                                  //obscureText: obscure,

                                  //scrollPadding: EdgeInsets.only(left: 10),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Unique University ID",
                                    //
                                  ),
                                )),
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
                                    controller: phone_Controller,
                                    //obscureText: obscure,
                                    keyboardType: TextInputType.phone,

                                    //scrollPadding: EdgeInsets.only(left: 10),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Phonenumber',
                                    ))),
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
                                  keyboardType: TextInputType.datetime,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: date_controller,
                                  //obscureText: obscure,
                                  onSaved: (String val) {
                                    date = val;
                                  },
                                  //scrollPadding: EdgeInsets.only(left: 10),
                                  decoration: InputDecoration(
                                    // suffixIcon: IconButton(
                                    //     icon:
                                    //         Icon(Icons.calendar_today_outlined),
                                    //     onPressed: () async {
                                    //       setState(() {
                                    //         date = _selectDate().toString();
                                    //       });
                                    //     }),
                                    border: InputBorder.none,
                                    labelText: 'Date of Registration',
                                    //
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
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
                              child: FloatingActionButton.extended(
                                label: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    final String username =
                                        username_Controller.text;
                                    final String phonenumber =
                                        phone_Controller.text;
                                    final String uid = email_controller.text;
                                    final String dob = date_controller.text;

                                    if (username.isNotEmpty &&
                                        phonenumber.isNotEmpty &&
                                        uid.isNotEmpty &&
                                        dob.isNotEmpty) {
                                      // _auth.createUserWithEmailAndPassword(
                                      // email: username, password: password);
                                      _handleDialogSubmission();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Load2UniInit2()));
                                    }
                                  }
                                },
                              ),
                            ),

                            // RichText(
                            //   text: TextSpan(
                            //       text: 'Have an Account ? Login',
                            //       style: TextStyle(
                            //           color: Colors.blue[700],
                            //           fontSize: 18,
                            //           decoration: TextDecoration.underline),
                            //       recognizer: TapGestureRecognizer()
                            //         ..onTap = () {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (BuildContext context) =>
                            //                       Login()));
                            //           // print('Terms of Service"');
                            //         }),
                            // )
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
