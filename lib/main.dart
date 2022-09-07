import 'package:fire/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fire/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:fire/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBNfB0FnpzZZ_wLUPkgcZUqZxuBeoj_i4A ",
      appId: "1:936133268937:android:f26fed9b21d0236aa3c418",
      messagingSenderId: "936133268937",
      projectId: "fire-b2d77",
    ),
  );

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });


}
*/



void main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBNfB0FnpzZZ_wLUPkgcZUqZxuBeoj_i4A ",
      appId: "1:936133268937:android:f26fed9b21d0236aa3c418",
      messagingSenderId: "936133268937",
      projectId: "fire-b2d77",
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}