import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  var _database = Firestore.instance;

  Future updateSession({name, password}) async {
    try {
      DocumentReference docRef = _database.collection('rankSessions').document();
      await docRef.setData({
        'name': name,
        'password': password,
      });
      return docRef.documentID;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future updateUserData({uid, name}) async {
    try {
      return await _database.collection('userData').document(uid).setData({
        'name': name,
      });
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future addSessionToUserData({sessionId, uid}) async {
    try {
      await _database
        .collection('userData').document(uid)
        .collection('rankSessions').document(sessionId).setData({});
      return true; 
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Stream<DocumentSnapshot> getUserData(uid) {
    try {
      return _database.collection('userData').document(uid).snapshots();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}

Database database = Database();