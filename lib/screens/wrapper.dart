import 'package:fire/screens/authenticate/authenticate.dart';
import 'package:fire/screens/authenticate/sign_in.dart';
import 'package:fire/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    return SignIn();

  }
}