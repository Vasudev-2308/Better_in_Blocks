import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _folded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
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
                  "Search",
                  style: TextStyle(
                      fontFamily: 'Cavier',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: MediaQuery.of(context).size.width / 1.15,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: kElevationToShadow[6],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.blue[800],
                                size: 30,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: InputBorder.none,
                            ),
                            autocorrect: true,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
