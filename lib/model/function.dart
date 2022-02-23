
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_service.dart';

moveToNewScreen(context,screen) async{

  FirebaseService service = new FirebaseService();
  try {
    await service.signOutFromGoogle();
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => screen
    ));
  } catch (e) {
    if (e is FirebaseAuthException) {
      print(e.message!);
    }
  }
}