import 'package:fire/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  //var _auth = null;

  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create user obj based on firebase user
  User1? _userFromFirebaseUser(User? user) {
    return user != null ? User1(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User1?> get user {
    return _auth.authStateChanges()
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password


// register with email and password

// sign out

}

