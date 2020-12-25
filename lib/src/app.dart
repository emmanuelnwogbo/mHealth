import 'package:flutter/material.dart';

import 'screens/landing/landing.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
        //title: 'Log Me In!',
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Landing()));
  }
}
