import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;

class curdMethods {

  bool isLoggedIn() {
    if(FirebaseAuth.instance.currentUser?.email! != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(empData) async{
    if(isLoggedIn()) {
      _firestore.collection('emp').doc(FirebaseAuth.instance.currentUser?.email).collection('empDetails').add(empData).catchError((e) {
        print(e);
      });
    } else {
      print('you need to be logged in');
    }
  }

  getData() async {
    return  _firestore.collection('emp').doc(FirebaseAuth.instance.currentUser?.email).collection('empDetails').get();
  }
}
