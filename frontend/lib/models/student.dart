import 'package:flutter/foundation.dart';

class StudentDetails {
  String uid;
  String uname;
  String phoneNumber;
  String dob;

  StudentDetails(@required this.uid, @required this.uname,
      @required this.phoneNumber, @required this.dob);
}
