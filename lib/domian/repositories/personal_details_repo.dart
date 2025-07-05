import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopywell/data/models/personal_details_model.dart';

class PersonalDetailsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveDetails(PersonalDetailsModel details) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      throw Exception("User not logged in");
    }

    await _firestore.collection('users').doc(uid).set(details.toMap());
  }
}

