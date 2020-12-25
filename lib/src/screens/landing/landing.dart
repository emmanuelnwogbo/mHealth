import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
            padding: EdgeInsets.only(top: mediaQuery.size.height / 10),
            height: mediaQuery.size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 35),
                Container(
                  child: Image.asset('assets/landinglogo.png'),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313030),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "M-Health",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313030),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    "The easiest way to diagnose illnesses and discover the best solutions.",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF313030),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "continue with:".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313030),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 14, right: 14),
                  child: ButtonTheme(
                    minWidth: mediaQuery.size.width,
                    height: 60.0,
                    child: FlatButton(
                      child: Text(
                        'Email'.toUpperCase(),
                        style: TextStyle(fontSize: 17.0),
                      ),
                      color: Color(0xFF665EFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthScreen()),
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
