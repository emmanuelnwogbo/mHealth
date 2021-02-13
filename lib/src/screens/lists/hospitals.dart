import 'package:flutter/material.dart';

import '../user/dashboard.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  var hospitals = <String>[
    "HOSPITALS AROUND YOU",
    "Yinka Clinic",
    "Ajao Hospital",
    "Lokoja City clinic",
    "Lekki Municipal Hospital",
    "Ikeja Hospital",
    "Luth Hospital",
    "Yinka Clinic",
    "Ajao Hospital",
    "Lokoja City clinic",
    "Lekki Municipal Hospital",
    "Ikeja Hospital",
    "Luth Hospital",
    "Yinka Clinic",
    "Ajao Hospital",
    "Lokoja City clinic",
    "Lekki Municipal Hospital",
    "Ikeja Hospital",
    "Luth Hospital",
    "Yinka Clinic",
    "Ajao Hospital",
    "Lokoja City clinic",
    "Lekki Municipal Hospital",
    "Ikeja Hospital",
    "Luth Hospital",
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: Container(
      height: mediaQuery.size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //color: Colors.red,
            margin: EdgeInsets.only(
              top: mediaQuery.size.height / 17,
              left: 17,
              right: 17,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      /*Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard('', '', '')),
                      );*/
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF454F63),
                      size: 27.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    )),
                Icon(
                  Icons.search,
                  color: Color(0xFF454F63),
                  size: 33.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              left: 17,
            ),
            child: Text(
              "Hospitals",
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                color: Color(0xFF665EFF),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
              child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: hospitals.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = hospitals[index];

              if (item == "HOSPITALS AROUND YOU") {
                return Container(
                    padding: EdgeInsets.only(
                      left: 17,
                      top: 17,
                      bottom: 17,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Color(0xFF454F63),
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ));
              }

              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hospitals()),
                    );
                  },
                  child: Container(
                      //height: 60.0,
                      margin: EdgeInsets.only(
                          top: 3.0, left: 17, right: 17, bottom: 10),
                      padding: EdgeInsets.only(
                          top: index == 1 ? 40 : 0, bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F7FA),
                        border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Color(0xFFD9D9D9)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item,
                                style: TextStyle(
                                  color: Color(0xFF454F63),
                                  decoration: TextDecoration.none,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('2km',
                                  style: TextStyle(
                                    color: Color(0xFF959DAD),
                                    decoration: TextDecoration.none,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF454F63),
                            size: 20.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          )
                        ],
                      )));
            },
          ))
        ],
      ),
    ));
  }
}
