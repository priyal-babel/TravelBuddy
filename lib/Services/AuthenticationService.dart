import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_buddy/DatabaseManager/DatabaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //registration
  Future createNewUser(
      String fname,
      String lname,
      String email,
      String phone,
      String gender,
      String college,
      String branch,
      String password,
      String year,
      String bio,
      DateTime dob,
      String profileurl,
      String idurl) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await DatabaseManager().createUserData(
            fname,
            lname,
            phone,
            gender,
            college,
            branch,
            year,
            bio,
            dob,
            profileurl,
            idurl,
            user.uid,
            email);
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // Future createNewUser(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     print(result);
  //     // await DatabaseManager().createUserData(name, 'Male', 100, user.uid);
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
