import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/universal/splashy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Better in Blocks',
      home: Splash(),
      //Scaffold(
      //   appBar: AppBar(
      //     title: Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       child: Text('Hello World'),
      //     ),
      //   ),
      // ),
    );
  }
}
