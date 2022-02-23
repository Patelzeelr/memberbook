import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/model/firebase_service.dart';
import 'package:sa_app/screens/home_screen.dart';

class GoogleButton extends StatefulWidget {
  GoogleButton({Key? key}) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading ? SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          FirebaseService service = new FirebaseService();
          try {
            await service.signInwithGoogle();
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => HomeScreen()
            ));
          } catch (e) {
            if (e is FirebaseAuthException) {
              print(e.message!);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: const Text('GOOGLE'),
        icon: const Icon(Icons.g_mobiledata,color: Colors.blue,),
      ),
    ) : const CircularProgressIndicator();
  }
}

