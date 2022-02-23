import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/model/function.dart';
import 'package:sa_app/screens/login_screen.dart';

class NavigateDrawer extends StatelessWidget{
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFffffff),
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildUserAccountsDrawerHeader(),
          ListTile(
            leading: Icon(Icons.logout,color: const Color(0xFF9e9e9e)),
            title: Text('LOGOUT',style: const TextStyle(color: Colors.black)),
            onTap: () async{
              moveToNewScreen(context, LoginScreen());
            },
          ),
          ],
      ),
    );
  }
  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(user!.displayName!,style: const TextStyle(fontSize: 20.0),),
      accountEmail: Text(user!.email!, style: const TextStyle(color: const Color(0xFF858585)),),
      currentAccountPicture: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF033d5b),width: 4.0),
          borderRadius: BorderRadius.circular(48.0),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(user!.photoURL!),
          radius: 20,
        )
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF033d5b),
      ),
    );
  }
}
