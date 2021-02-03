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
  bool _signup = true;

  void _setFormView() {
    setState(() {
      _signup ? _signup = false : _signup = true;
    });
  }

  Widget build(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Material(
        child: Container(
            height: mediaQuery.size.height,
            child: Padding(
                padding: EdgeInsets.only(
                    top: mediaQuery.size.height / 13, left: 20, right: 20),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonTheme(
                              height: 40.0,
                              child: FlatButton(
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: TextStyle(fontSize: 17.0),
                                ),
                                color: _signup
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF665EFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                textColor: _signup
                                    ? Color(0xFF78849E)
                                    : Color(0xFFFFFFFF),
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
                                color: !_signup
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF665EFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                textColor: !_signup
                                    ? Color(0xFF78849E)
                                    : Color(0xFFFFFFFF),
                                onPressed: () {
                                  _setFormView();
                                },
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _signup ? SignUp() : SignIn()
                  ],
                )))));
  }
}
