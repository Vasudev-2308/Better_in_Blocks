import 'package:flutter/material.dart';
import 'package:frontend/screens/student/add_certif.dart';
import 'package:frontend/screens/student/search.dart';
import 'package:frontend/screens/student/userprofile.dart';
import 'package:frontend/screens/student/view_certificates.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  PageController pageController;
  int selectedpage = 0;
  List<Widget> tabs = <Widget>[
    CertifView(),
    SearchView(),
    CertifAddView(),
    UserView()
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
            pageController.jumpToPage(
              index,
              //curve: Curves.fastOutSlowIn,
              //duration: Duration(milliseconds: 300)
            );
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff0072ff),
          currentIndex: selectedpage,
          selectedItemColor: Colors.purple[700],
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.all_inbox,
                //color: Colors.deepPurple,
              ),
              label: "Certificates",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search
                  //color: Colors.deepPurple,
                  ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                // color: Colors.deepPurple,
              ),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.deepPurple,
              ),
              label: "Profile",
            )
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
