
import 'package:flutter/material.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';


class PatientProfile extends StatefulWidget {
  Patients patients = Patients();
   PatientProfile(this.patients ,{Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<PatientProfile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.of(context).primaryColor,

        title: const Text(
          'Profile',
          // style: FlutterFlowTheme.of(context).title2.override(
          //   fontFamily: 'Poppins',
          //   color: Colors.white,
          //   fontSize: 22,
          // ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              const Text(
                'Name:-',
                textAlign: TextAlign.start,
                // style: FlutterFlowTheme.of(context).bodyText1.override(
                //   fontFamily: 'Poppins',
                //   fontWeight: FontWeight.w600,
                // ),
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 10),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.name,
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Birth Date:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 5),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.birthDate,
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Aadhar:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 5),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.aadharNo,
                  // style: FlutterFlowTheme.of(context).bodyText1,

                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Phone:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 5),

              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.contNo,
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Address:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 5),

              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.address,
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Blood Group:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              const SizedBox(height: 15),

               Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,

                color: const Color(0xFFF5F5F5),
                child: Text(
                  widget.patients.bloodGr,
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
