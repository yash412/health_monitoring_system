import 'package:health_monitoring_system/models/authModel.dart';
import 'package:health_monitoring_system/models/doctorModel.dart';
import 'package:health_monitoring_system/models/labModel.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';

import 'package:health_monitoring_system/screens/auth/choose_user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/screens/login/login_screen.dart';
import 'package:health_monitoring_system/screens/profile/labProfile/lab.dart';
import 'package:health_monitoring_system/screens/profile/patientProfile/patient.dart';

import '../../constants.dart';

import '../profile/doctorProfile/doctor.dart';
import 'components/sign_in_form.dart';
import '../auth/after_login.dart';
import '../../db/database.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // It's time to validate the text field
  final _formKey = GlobalKey<FormState>();
  var items = ['Doctor', 'Patient', 'LAB'];
  String dropDownValue = 'Doctor';

  late String contact;
  final AuthModel _auth = AuthModel();
  Database _database = Database();
  Patients _patients = Patients();
  Doctors _doctors = Doctors();
  Labs _labs = Labs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            // Now it takes 100% of our height
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: SizedBox(
                  height: 1000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChooseUser(),
                              ),
                            ),
                            child: const Text(
                              "Sign Up!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Row(
                        children: [
                          const Text("User Type  ",
                              style: TextStyle(color: Color(0xFF35364F))),
                          const SizedBox(width: defaultPadding),
                          DropdownButton(
                            // Initial Value
                            value: dropDownValue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,
                                    style: const TextStyle(
                                        color: Color(0xFF35364F))),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      SignInForm(
                        formKey: _formKey,
                        auth: _auth,
                      ),
                      // Container(child: const LoginScreen()),
                      const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Sign up form is done
                              // It saved our inputs
                              _formKey.currentState!.save();
                              //  Sign in also done
                              // _fetch(_auth.email,_auth.userType);

                              if (dropDownValue == 'Patient') {
                                _patients = await _database.fetchPatient(
                                    'patient', _auth.email, _auth.password);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          // LoginScreen(_patients,_patients.contNo ,dropDownValue),
                                          PatientHomeScreen(_patients),
                                    ));
                              }
                              if (dropDownValue == 'Doctor') {
                                _doctors = await _database.fetchDoctor(
                                    'doctor', _auth.email, _auth.password);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          // LoginScreen(_doctors, _doctors.contNo,dropDownValue),
                                          DoctorHomeScreen(_doctors),
                                    ));
                              }
                              if (dropDownValue == 'LAB') {
                                _labs = await _database.fetchLab(
                                    'labs', _auth.email, _auth.password);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>LabHomeScreen(_labs),
                                    ));

                              }
                            }
                          },
                          child: const Text("Sign In"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
