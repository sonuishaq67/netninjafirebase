import 'package:brewcrew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    //
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  //
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    //
    return snapshot.docs
        .map((doc) => Brew(
              name: doc.data.call()['name'] ?? '',
              strength: doc.data.call()['strength'] ?? 0,
              sugars: doc.data.call()['sugars'] ?? '0',
            ))
        .toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
