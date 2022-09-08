import 'package:fire/models/fire.dart';
import 'package:fire/screens/home/fire_list.dart';
import 'package:flutter/material.dart';
import 'package:fire/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Fire>?>.value(
      value: DatabaseService(uid: '').fires,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Fire and Blood'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: FireList(),
      ),
    );
  }
}