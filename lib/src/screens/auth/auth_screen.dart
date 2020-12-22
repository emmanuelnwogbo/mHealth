import 'package:flutter/material.dart';

import './signup.dart';
import './signin.dart';

class AuthScreen extends StatefulWidget {
  createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _signup = true;

  void _setFormView() {
    setState(() {
      _signup ? _signup = false : _signup = true;
    });
  }

  @override
  Widget build(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
        height: mediaQuery.size.height,
        color: Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: (mediaQuery.size.height / 10)),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                        height: 40.0,
                        child: FlatButton(
                          child: Text(
                            'Sign In'.toUpperCase(),
                            style: TextStyle(fontSize: 17.0),
                          ),
                          color:
                              _signup ? Color(0xFFFFFFFF) : Color(0xFF665EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textColor:
                              _signup ? Color(0xFF78849E) : Color(0xFFFFFFFF),
                          onPressed: () {
                            _setFormView();
                          },
                        )),
                    ButtonTheme(
                        height: 40.0,
                        child: FlatButton(
                          child: Text(
                            'Sign Up'.toUpperCase(),
                            style: TextStyle(fontSize: 17.0),
                          ),
                          color:
                              !_signup ? Color(0xFFFFFFFF) : Color(0xFF665EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textColor:
                              !_signup ? Color(0xFF78849E) : Color(0xFFFFFFFF),
                          onPressed: () {
                            _setFormView();
                          },
                        )),
                  ],
                )),
                SizedBox(height: (mediaQuery.size.height / 28)),
                Container(
                  //width: mediaQuery.size.width / 1.1,
                  child: _signup ? SignUp() : SignIn(),
                )
              ],
            ),
          ),
        ));
  }
}
