import 'package:flutter/material.dart';

import '../lists/hospitals.dart';
import '../lists/pharmacies.dart';
import '../lists/laboratories.dart';
import '../lists/diagnosis.dart';

import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  String firstname;
  String email;
  String password;
  Dashboard(this.firstname, this.email, this.password);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String url = "http://faef1053d904.ngrok.io/v0.1/auth/signin";

  @override
  void initState() {
    /*super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
      http.post(url, body: {
        "email": widget.email,
        "password": widget.password,
        "remember_me": "true"
      }).then((response) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
      });
    });*/
  }

  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          top: mediaQuery.size.height / 10, left: 15, right: 15),
      height: mediaQuery.size.height,
      color: Color(0xFFFFFFFF),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello, ${widget.firstname}',
            style: TextStyle(
              //background: paint,
              fontSize: 38.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: Color(0xFF665EFF),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'How can we help you today?',
            style: TextStyle(
                color: Colors.black54,
                decoration: TextDecoration.none,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
              child: GridView.count(
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio:
                (mediaQuery.size.height * .8 / mediaQuery.size.width * .5),
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Diagnosis()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Diagnosis',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: AssetImage('assets/diagnosis.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hospitals()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Hospitals',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: AssetImage('assets/hospitals.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pharmacies()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Consult a Doctor',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: AssetImage('assets/doctor.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Laboratories()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Laboratories',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: AssetImage('assets/labs.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pharmacies()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          width: double.infinity,
                          child: Text(
                            'Pharmacies',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF353A50),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image: AssetImage('assets/pharmacies.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ],
          )),
          SizedBox(
            height: 20.0,
          )
        ],
      )),
    ));
  }
}
