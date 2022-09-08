import 'package:fire/models/fire.dart';
import 'package:flutter/material.dart';

class FireTile extends StatelessWidget {

  final Fire fire;
  FireTile({ required this.fire });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[fire.strength],
          ),
          title: Text(fire.name),
          subtitle: Text('Takes ${fire.sugars} sugar(s)'),
        ),
      ),
    );
  }
}