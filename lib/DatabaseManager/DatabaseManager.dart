import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData(
      String fname,
      String lname,
      String phone,
      String gender,
      String college,
      String branch,
      String year,
      String bio,
      DateTime dob,
      String profileurl,
      String idurl,
      String Uid) async {
    return await profileList.doc(Uid).set({
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'gender': gender,
      'college': college,
      'branch': branch,
      'year': year,
      'bio': bio,
      'dob': dob,
      'profileurl': profileurl,
      'idurl': idurl
    });
  }
}
