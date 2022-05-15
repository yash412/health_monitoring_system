
import 'package:flutter/material.dart';


class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          // style: FlutterFlowTheme.of(context).title2.override(
          //   fontFamily: 'Poppins',
          //   color: Colors.white,
          //   fontSize: 22,
          // ),
        ),
        actions: [],
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
            children: const [
              SizedBox(height: 20),
              Text(
                'Name:-',
                textAlign: TextAlign.start,
                // style: FlutterFlowTheme.of(context).bodyText1.override(
                //   fontFamily: 'Poppins',
                //   fontWeight: FontWeight.w600,
                // ),
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 10),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  'Sujay Deshmukh',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Birth Date:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 5),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  '10/08/2000',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Aadhar:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 5),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  '326859072828',
                  // style: FlutterFlowTheme.of(context).bodyText1,

                ),
              ),
              SizedBox(height: 25),
              Text(
                'Phone:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 5),

              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  '7559486512',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Address:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 5),

              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  'MGICOET',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Blood Group:-',
                // style: FlutterFlowTheme.of(context).bodyText1,
                style: TextStyle(height: 2, fontSize: 20,fontFamily: 'Poppins',fontWeight:FontWeight.w600 ),
              ),
              SizedBox(height: 15),

              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Text(
                  'AB+',
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
