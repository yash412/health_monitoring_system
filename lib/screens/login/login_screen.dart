import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/models/doctorModel.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';
import 'package:health_monitoring_system/screens/profile/doctorProfile/doctor.dart';
import 'package:health_monitoring_system/screens/profile/patientProfile/patient.dart';
import '../../constants.dart';
import '../auth/choose_user.dart';
import 'home_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
   LoginScreen( this.obj,this.phone, this.userType,{Key? key}) : super(key: key);
  String phone ,userType;

  // static Doctors _doctors = Doctors();
  // static Patients _patients = Patients();
  var obj;
  static void setLoginVar(obj){
    obj = obj;
  }



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        if(widget.userType=='Doctor'){

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DoctorHomeScreen(widget.obj)));
        }
        if(widget.userType == 'Patient'){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientHomeScreen(widget.obj)));
        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text(e.message as String)));
    }
  }

  getMobile(String phone) async {
      showLoading = true;

      await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phone,
        verificationCompleted: (phoneAuthCredential) async {

            showLoading = false;

          //signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async {

            showLoading = false;

          SnackBar(content: Text(verificationFailed.message as String));
        },
        codeSent: (verificationId, resendingToken) async {

            showLoading = false;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            this.verificationId = verificationId;

        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: const Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
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
            child: logIn(widget.phone),
          ),
        ),
      ]),
    );
  }

  Widget logIn(String phone) {
    getMobile(phone);
    return Container(
      height: 100,
      width: 200,
      child:getOtpFormWidget(context),
      padding: const EdgeInsets.all(16),
    );
  }
}
