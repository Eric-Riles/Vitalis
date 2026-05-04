import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {

  final FirebaseFirestore _storageInst = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream(){
    return _storageInst.collection("User").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }
}