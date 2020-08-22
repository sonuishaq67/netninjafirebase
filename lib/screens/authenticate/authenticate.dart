import 'package:brewcrew/screens/authenticate/register.dart';
import 'package:brewcrew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSI = true;
  void toggleView() {
    setState(() {
      showSI = !showSI;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSI) {
      return SignIn(toggleview: toggleView);
    } else {
      return Register(toggleview: toggleView);
    }
  }
}
