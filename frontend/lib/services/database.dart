import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:todo_app_firebase/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addStudent(Map<String, dynamic> task) async {
    await _db.collection('student').doc().set(task);
  }

  static Future<void> addInstitute(Map<String, dynamic> task) async {
    await _db.collection('university').doc().set(task);
  }
}
