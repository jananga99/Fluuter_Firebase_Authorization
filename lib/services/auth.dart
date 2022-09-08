import 'package:fire/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire/services/database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('0','new crew member', 100);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


// register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}

