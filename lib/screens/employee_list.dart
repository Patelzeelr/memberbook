import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/model/curd.dart';

final _firestore = FirebaseFirestore.instance;

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late QuerySnapshot employees;

  curdMethods curdObj = curdMethods();

  @override
  void initState() {
    curdObj.getData().then((result) {
      setState(() {
        employees = result;
      });
    });
    super.initState();
  }

  Future<void> _getData() async {
    curdObj.getData().then((result) {
      setState(() {
        employees = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      body: _employeeList(),
    );
  }

  Widget _employeeList() => RefreshIndicator(
      onRefresh: _getData,
      child: ListView.builder(
          itemCount: employees.docs.length,
          itemBuilder: (contexts, i) {
            return Card(
              child: ListTile(
                title: Text(employees.docs[i]['name']),
                subtitle: Text(employees.docs[i]['city']),
                trailing: IconButton(
                  onPressed: () async{
                    await _firestore.collection('emp').doc(FirebaseAuth.instance.currentUser?.email).collection('empDetails').doc(employees.docs[i].id).delete();
                    var snackbar = SnackBar(
                      behavior: SnackBarBehavior.fixed,
                      content: const Text('Deleted!'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    );
                    _scaffoldKey.currentState?.showSnackBar(snackbar);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }),
    );
  }

