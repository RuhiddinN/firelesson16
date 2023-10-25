import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firelesson16/user_models.dart';

class DatabaseServices {
  String collectionName = 'football';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Add
  Future<void> add(FootBall footBall) async {
    final collection = firestore.collection(collectionName);
    await collection.add(footBall.toJson());
  }

  //Get
  Future<List<FootBall>> get() async {
    List<FootBall> football = [];

    final collection = firestore.collection(collectionName);
    final result = await collection.get();
    for (final item in result.docs) {
      try {
        FootBall footBall = FootBall.fromJson(item.data());
        footBall.id = item.id;
        log(item.id);
        log("${footBall.rating}");
        football.add(footBall);
      } catch (e) {
        log("$e");
      }
    }
    return football;
  }

  //Update
  Future<void> update(FootBall footBall) async {
    final collection = firestore.collection(collectionName);
    collection.doc(footBall.id).update(footBall.toJson());
  }

  //Delete

  Future<void> delete(String id) async {
    final collection = firestore.collection(collectionName);
    collection.doc(id).delete();
  }
}
