import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';
import 'package:health_monitoring_system/screens/profile/patientProfile/patientHistory.dart';
import 'package:health_monitoring_system/screens/profile/patientProfile/patientPrescription.dart';
import 'package:health_monitoring_system/screens/welcome/welcome_screen.dart';
import '../../../constants.dart';
import 'PatientProfile.dart';
import 'upload.dart';

class PatientHomeScreen extends StatelessWidget {
  Patients _patients = Patients();


  PatientHomeScreen(this._patients,this.auth, {Key? key}) : super(key: key);
var auth;
  static var ref = FirebaseFirestore.instance.collection("patient");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + _patients.name),
        actions: [
          IconButton(
            onPressed: (){
              auth.signOut();
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            icon: Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            child: SafeArea(
              child: myProfile(context),
            ),
          )
        ],
      ),
    );
  }

  Widget myProfile(BuildContext buildContext) {
    return Column(
      children: [

        Row(
          children: [
            Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20.0),
                // width: 200,
                // height: 200,
                // padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(child: Text('History')),
                  ),
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (context) =>  PatientHistory(_patients)));
                  },
                )),
            Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20.0),
                // width: 200,
                // height: 200,
                // padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(child: Text('Profile')),
                  ),
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (context) =>  PatientProfile(_patients)));
                  },
                )),
          ],
        ),
        Row(
          children: [
            Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (context) => PatientPrescription(_patients)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                        child: Text(
                      'Prescription',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          fontStyle: FontStyle.normal),
                    )),
                  ),
                )),
            Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20.0),
                // width: 200,
                // height: 200,
                // padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(child: Text('Upload Document')),
                  ),
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (context) => UploadDocument(_patients,ref)));
                  },
                )),
          ],
        ),
      ],
    );
  }
}
