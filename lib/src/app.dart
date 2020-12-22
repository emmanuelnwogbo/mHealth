import 'package:flutter/material.dart';

import 'screens/auth/auth_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
        //title: 'Log Me In!',
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: AuthScreen()));
  }
}
