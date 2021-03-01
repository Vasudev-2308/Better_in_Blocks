import 'package:flutter/material.dart';
import 'splashy.dart';

void main() => runApp(MyApp());

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
