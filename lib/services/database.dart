import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/fire.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  DatabaseService.withoutUID() : uid = "";

  // collection reference
  final CollectionReference fireCollection = FirebaseFirestore.instance.collection('fire');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await fireCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // fire list from snapshot
  List<Fire> _fireListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Fire(
          name: doc['name'] ?? '',
          strength: doc['strength'] ?? 0,
          sugars: doc['sugars'] ?? '0'
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Fire>> get fires {
    return fireCollection.snapshots()
        .map(_fireListFromSnapshot);
  }

}