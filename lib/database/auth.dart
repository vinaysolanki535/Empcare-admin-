

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'firestore.dart';

class AuthService{

  DatabaseService databaseService = new DatabaseService();

//  SharedPreferences sharedPreferences;

//  static String sharedPrefUserName = "userName";
//  static String sharedPrefUserId = "userId";
//  GoogleSignIn _googleSignIn = GoogleSignIn();


  //Firebase Auth Instance
  FirebaseAuth _auth  = FirebaseAuth.instance;

  //method to register with email and password
  Future registerWithEmailAndPassword({String email,String password,String name, String phone,String address, String idProof})async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user  = result.user;

      await databaseService.createUserInDatabase(email: email,userId:user.uid,
          fullName: name,phone: phone,password: password,address:  address,idProof: idProof);

//      await saveUserNameSharedPref(name);
//      await saveUserIdSharedPref(user.uid);

        return user.uid;

    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

//  Future signInUserWithEmailAndPassword(String email, String password) async{
//    try {
//      AuthResult result = await _auth.signInWithEmailAndPassword(
//          email: email, password: password);
//
//      FirebaseUser user  = result.user;
//      return user.uid;
//    }
//    catch(e) {
//      return e.toString();
//    }
//  }

//  Future<FirebaseUser> googleSignIn() async {
//    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    AuthCredential credential = GoogleAuthProvider.getCredential(idToken:googleAuth.idToken,
//        accessToken: googleAuth.accessToken);
//
//    AuthResult result = await _auth.signInWithCredential(credential);
//    FirebaseUser user  = result.user;
//    await databaseService.createUserInDatabase(email:
//    user.email,userId:user.uid,name: user.displayName,
//        profilePic: user.photoUrl,
//        phone: user.phoneNumber);
//    return user;
//  }
//
//  //forgot password
//  Future<void> resetPassword({String email})async{
//    await _auth.sendPasswordResetEmail(email: email);
//  }
//
//
//
//
//  static Future<void> saveUserNameSharedPref(String userName) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return await prefs.setString(sharedPrefUserName, userName);
//
//  }
//
//  static Future<void> saveUserIdSharedPref(String userId) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return await prefs.setString(sharedPrefUserId, userId);
//
//  }
//
//
//
//  static Future<String> getUserNameSharePref() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return  prefs.getString(sharedPrefUserName);
//
//  }
//
//  static Future<String> getUserIdSharedPref() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return  prefs.getString(sharedPrefUserId);
//
//  }



}