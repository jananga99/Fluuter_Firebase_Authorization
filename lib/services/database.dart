import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference fireCollection = FirebaseFirestore.instance.collection('fire');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await fireCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }


}