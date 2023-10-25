import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firelesson16/user_models.dart';

class RealtimeDbServices {
  FirebaseDatabase database = FirebaseDatabase.instance;

  ///add
  Future<void> add(FootBall footBall) async {
    DatabaseReference ref = database.ref('football/1007');
    await ref.set(footBall.toJson());
  }

  ///get
  Future get(String id) async {
    DatabaseReference ref = database.ref("football");
    final data = await ref.child("/1007").get();
    return data.value;
  }

  ///Update
  Future<void> update(FootBall footBall) async {
    DatabaseReference ref = database.ref('football/1007');
    await ref.update(footBall.toJson());
  }

  ///Delete
  Future<void> delete() async {
    DatabaseReference ref = database.ref('football/1007');
    final deleteData = await ref.child("/1007").remove();
    return deleteData;
  }
}
