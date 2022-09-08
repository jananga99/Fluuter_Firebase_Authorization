import 'package:fire/models/fire.dart';
import 'package:fire/screens/home/fire_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FireList extends StatefulWidget {
  @override
  _FireListState createState() => _FireListState();
}

class _FireListState extends State<FireList> {
  @override
  Widget build(BuildContext context) {

    final fires = Provider.of<List<Fire>>(context);
    return ListView.builder(
      itemCount: fires.length,
      itemBuilder: (context, index) {
        return FireTile(fire: fires[index]);
      },
    );
  }
}