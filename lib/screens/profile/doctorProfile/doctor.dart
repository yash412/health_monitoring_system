import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/models/doctorModel.dart';

import '../../../constants.dart';

import '../../addPatientDetails.dart';



class DoctorHomeScreen extends StatelessWidget {

 Doctors _doctors = Doctors();
  DoctorHomeScreen(this._doctors, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + _doctors.drName),
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
    return Row(
      children: [
        Container(
            width: 180,
            height: 180,
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                  child: Text(
                'Profile',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    fontStyle: FontStyle.normal),
              )),
            )),
        Container(
            width: 180,
            height: 180,
            padding: const EdgeInsets.all(20.0),
            // width: 200,
            // height: 200,
            // padding: const EdgeInsets.all(20.0),
            child: GestureDetector(child : Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),

              ),
              child:const Center(child: Text('Add Prescription')),

            ),onTap:(){
              Navigator.push(buildContext,MaterialPageRoute(builder: (context) => AddPatientDetails()));
            } ,)),
      ],
    );
  }
}
