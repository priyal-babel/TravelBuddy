import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');
  final CollectionReference traveldetails =
      FirebaseFirestore.instance.collection('traveldetails');

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
      String Uid,
      String email) async {
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
      'idurl': idurl,
      'email': email
    });
  }

  Future<void> details(String from, String to, int mode, String Uid) async {
    return await traveldetails.doc(Uid).set({
      'from': from,
      'to': to,
      'mode': mode,
    });
  }

  Future getData(String from, String to, int mode) async {
    var result = await FirebaseFirestore.instance
        .collection("traveldetails")
        .where("from", isEqualTo: from)
        .where("to", isEqualTo: to)
        .where("mode", isEqualTo: mode)
        .get();

    return result;
  }
// static Future<List<Need>> getNeeds() async {
//     Query needsSnapshot = await FirebaseDatabase.instance
//       .reference()
//       .child("needs-posts")
//       .orderByKey();

//     print(needsSnapshot); // to debug and see if data is returned

//     List<Need> needs=[];

//     Map<dynamic, dynamic> values = needsSnapshot.data.value;
//     values.forEach((key, values) {
//       needs.add(values);
//     });

//     return needs;
//   }

}

class Need {
  final String? id;
  final String imageUrl;
  final String caption;
  final String title;

  Need({
    required this.id,
    required this.imageUrl,
    required this.caption,
    required this.title,
  });

  Need.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        imageUrl = snapshot.value["imageUrl"],
        caption = snapshot.value["caption"],
        title = snapshot.value["postTitle"];

  toJson() {
    return {
      "imageUrl": imageUrl,
      "caption": caption,
      "title": title,
    };
  }
}
