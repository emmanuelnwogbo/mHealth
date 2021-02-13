import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;

import './validate.dart';

import '../user/dashboard.dart';

class SignUp extends StatefulWidget {
  String baseUrl;
  SignUp(this.baseUrl);
  @override
  createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final double inputSpacing = 25.0;
  final String urlGetter = "https://medhealthurl.herokuapp.com/url";
  String baseUrl = "https://9a5631fec4e3.ngrok.io/v0.1";
  bool isLoading = false;

  String baseUrlTwo = "";

  routeToDashboard() {
    setState(() {
      isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Dashboard(firstname, email, password, widget.baseUrl)),
    );
  }

  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  String confirmpassword = "";

  String userName = "";
  String userToken = "";

  void signUp() {
    setState(() {
      isLoading = true;
    });

    http.post("$baseUrlTwo/guests/register", body: {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password
    }).then((response) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(response);
      //print(jsonResponse.data);
      print(jsonResponse);
      setState(() {
        isLoading = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Dashboard(firstname, email, password, widget.baseUrl)),
      );
    });
  }

  void initState() {
    setState(() {
      baseUrlTwo = widget.baseUrl;
    });
  }

  Widget build(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF78849E),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
                  ),
                  hintText: 'First Name',
                ),
                onSaved: (String value) {
                  firstname = value;
                }),
            SizedBox(
              height: inputSpacing,
            ),
            TextFormField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF78849E), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
                  ),
                  hintText: 'Last Name',
                ),
                onSaved: (String value) {
                  lastname = value;
                }),
            SizedBox(
              height: inputSpacing,
            ),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF78849E), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
                  ),
                  hintText: 'Email',
                ),
                onSaved: (String value) {
                  email = value;
                }),
            SizedBox(
              height: inputSpacing,
            ),
            TextFormField(
                obscureText: true,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF78849E), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
                  ),
                  hintText: 'Password',
                ),
                onSaved: (String value) {
                  password = value;
                }),
            SizedBox(
              height: inputSpacing,
            ),
            TextFormField(
                obscureText: true,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF78849E), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
                  ),
                  hintText: 'Confirm Password',
                ),
                onSaved: (String value) {
                  confirmpassword = value;
                }),
            SizedBox(
              height: inputSpacing,
            ),
            ButtonTheme(
              minWidth: mediaQuery.size.width,
              height: 60.0,
              child: FlatButton(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Continue'.toUpperCase(),
                        style: TextStyle(fontSize: 17.0),
                      ),
                color: Color(0xFF665EFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textColor: Colors.white,
                onPressed: () {
                  formKey.currentState.save();
                  setState(() {
                    isLoading = true;
                  });
                  signUp();
                },
              ),
            )
          ],
        ));
  }
}
