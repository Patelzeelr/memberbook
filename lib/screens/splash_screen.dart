import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/screens/home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 500.0).animate(curve);

    controller.forward();

    startTimer();
  }

  Widget builder(BuildContext context, Widget? child) {
    return Container(
      height: animation.value,
      width: animation.value,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  startTimer() async {
    var duration = Duration(milliseconds: 10000);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    if (FirebaseAuth.instance.currentUser?.email! != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: AnimatedBuilder(animation: animation, builder: builder),
            ),
          ),
        ],
      ),
    ));
  }
}
