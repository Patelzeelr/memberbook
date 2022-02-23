import 'package:flutter/material.dart';
import 'package:sa_app/constants/constants.dart';
import 'package:sa_app/model/curd.dart';
import 'package:sa_app/widgets/button.dart';
import 'package:sa_app/widgets/textfield.dart';

class AddEmployee extends StatefulWidget{

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  late String name;
  late String city;
  late String mentor;

  late FocusNode fName = FocusNode();
  late FocusNode fCity = FocusNode();
  late FocusNode fMentor = FocusNode();

  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final mentorController = TextEditingController();

  curdMethods curdObj = curdMethods();

  @override
  void dispose() {
    fName.dispose();
    fCity.dispose();
    fMentor.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    cityController.clear();
    mentorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getEmployeeName(),
              buildSizedBox(),
              _getEmployeeCity(),
              buildSizedBox(),
              _getEmployeeMentorName(),
              buildSizedBox(),
              _addEmployeeInformation(),         
            ],
          ),),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 20.0,);

  Widget _addEmployeeInformation() => RoundButton(
      'ADD',
      appBarColor,
          () {
        Map<String, dynamic> empData = {
          'name': name,
          'city': city,
          'mentor': mentor,
        };
        curdObj.addData(empData);
        clear();
      },
  );
  Widget _getEmployeeName() => CustomTextfield(
      TextInputType.text,
      'Enter Employee Name',
      nameController,
          (value) {
            name = value;
          },
      fName,
      fCity
  );
  Widget _getEmployeeCity() => CustomTextfield(
      TextInputType.text,
      'Enter Employee City',
      cityController,
          (value) {
        city = value;
      },
      fCity,
      fMentor
  );
  Widget _getEmployeeMentorName() => CustomTextfield(
          TextInputType.text,
          'Enter Employee Mentor Name',
          mentorController,
              (value) {
            mentor = value;
          },
      fMentor,
      fName
      );
}