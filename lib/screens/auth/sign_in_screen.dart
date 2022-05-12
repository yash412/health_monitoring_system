import 'package:health_monitoring_system/screens/auth/choose_user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/screens/login/login_screen.dart';

import '../../constants.dart';
import '../profile/doctorProfile/doctor.dart';
import '../profile/patientProfile/patient.dart';
import 'components/sign_in_form.dart';
import '../auth/after_login.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // It's time to validate the text field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
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
                      // SignInForm(formKey: _formKey),
                     Container(child: const LoginScreen()),
                      const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Sign up form is done
                              // It saved our inputs
                              _formKey.currentState!.save();
                              //  Sign in also done
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AfterUser(),
                                  ));
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
