import 'package:brewcrew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    try {
      print(brews.length);
      brews.forEach((brew) {
        print(brew.sugars);
        print(brew.strength);
        print(brew.name);
      });
    } catch (e) {
      //print(e.toString());
    }

    return Container();
  }
}
