import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

// collection reference for users
  final CollectionReference cartCollection =
      Firestore.instance.collection('items'); // Create if not exist

  Future updateUserData(String sugars, String name, int strength) async {
    return await cartCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return cartCollection.snapshots().map(_brewListFromSnapshot);
  }
}
