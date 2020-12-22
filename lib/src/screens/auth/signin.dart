import 'package:flutter/material.dart';

import './input.dart';

class SignIn extends StatefulWidget {
  createState() {
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final InputFields = <Input>[];

  String email = "";
  String password = "";
  final textFieldNum = 2;

  Widget build(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    var formList = new List<int>.generate(textFieldNum, (i) => i + 1);
    formList.forEach((i) {
      return InputFields.add(new Input("email"));
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
                'Sign In'.toUpperCase(),
                style: TextStyle(fontSize: 17.0),
              ),
              color: Color(0xFF665EFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        )
      ]),
    ));
  }
}
