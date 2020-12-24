import 'package:flutter/material.dart';

import './input.dart';


import './user/dashboard.dart';

class SignUp extends StatefulWidget {
  createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final InputFields = <Input>[];

  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  String confirmpassword = "";

  var formList = <String>[
    "First Name",
    "Last Name",
    "Email Address",
    "Password",
    "Confirm Password"
  ];

  Widget build(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    formList.forEach((i) {
      return InputFields.add(new Input(i));
    });

    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Container(
          child: Column(children: InputFields),
        ),
        Container(
          margin: EdgeInsets.only(top: 40, left: 14, right: 14),
          child: ButtonTheme(
            minWidth: mediaQuery.size.width,
            height: 60.0,
            child: FlatButton(
              child: Text(
                'Continue'.toUpperCase(),
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
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
          ),
        )
      ]),
    ));
  }
}
