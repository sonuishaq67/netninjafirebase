import 'package:flutter/material.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //home or authenticate
    return MaterialApp(
      home: Authenticate(),
    );
  }
}