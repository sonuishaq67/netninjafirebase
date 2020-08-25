import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/models/usernew.dart';
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

  UserData _userDataFromSS(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data.call()['name'],
        strength: snapshot.data.call()['strength'],
        sugars: snapshot.data.call()['sugars']);
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSS);
  }
}
