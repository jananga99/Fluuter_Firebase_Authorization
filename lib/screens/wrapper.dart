import 'package:fire/screens/authenticate/authenticate.dart';
import 'package:fire/models/user.dart';
import 'package:fire/screens/authenticate/sign_in.dart';
import 'package:fire/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User1?>(context);
    print(user);
    // return either the Home or Authenticate widget
    if (user == null){
      return SignIn();
    } else {
      return Home();
    }

  }
}