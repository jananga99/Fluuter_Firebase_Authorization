import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  late FirebaseAuth _auth;

  Future init() async{
    await Firebase.initializeApp(
        options: FirebaseOptions(
        apiKey: "AIzaSyBNfB0FnpzZZ_wLUPkgcZUqZxuBeoj_i4A ",
        appId: "1:936133268937:android:f26fed9b21d0236aa3c418",
        messagingSenderId: "936133268937",
        projectId: "fire-b2d77",
      )
    );
    _auth = FirebaseAuth.instance;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      await init();
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password


// register with email and password

// sign out

}

