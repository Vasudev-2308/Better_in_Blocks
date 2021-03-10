import 'package:flutter/material.dart';

import 'package:frontend/screens/student/view_certificates.dart';
import 'package:frontend/screens/university/requests.dart';
import 'package:frontend/screens/university/universityprofile.dart';
import 'package:frontend/screens/university/validated_certif.dart';

class UniversityInit extends StatefulWidget {
  @override
  _UniversityInitState createState() => _UniversityInitState();
}

class _UniversityInitState extends State<UniversityInit> {
  PageController pageController;
  int selectedpage = 0;
  List<Widget> tabs = <Widget>[
    ValidatedCertif(),
    UniversityRequestsView(),
    UniversityView(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: PageView(
        controller: pageController,
        children: tabs,
        onPageChanged: (index) {
          setState(() {
            selectedpage = index;
            pageController.animateToPage(index,
                curve: Curves.easeInOut, duration: Duration(milliseconds: 300));
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff0072ff),
          currentIndex: selectedpage,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.all_inbox,
                //color: Colors.deepPurple,
              ),
              label: "Validated",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_quote
                  //color: Colors.deepPurple,
                  ),
              label: "Requests",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                // color: Colors.deepPurple,
              ),
              label: "University",
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedpage = index;
              //print("$selectedpage");
              pageController.jumpToPage(index);
            });
          }),
    );
  }
}
