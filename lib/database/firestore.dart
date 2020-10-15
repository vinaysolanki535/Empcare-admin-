import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  Firestore db = Firestore.instance;

  //saving user data to Firestore...
  Future<dynamic> createUserInDatabase({String email, String userId,String fullName,String profilePic,String phone,String password,String address, String idProof}) async{
    try {
      await db.collection('Users').document(userId).setData({
        'email':email,
        'name':fullName,
        'address' : address,
         'idProof':  idProof,
        'phone': phone,
        'password' : password,
      });
    }
    catch(e) {
      print(e.toString());
    }

  }
}