import 'package:health_monitoring_system/constants.dart';
import 'package:health_monitoring_system/screens/auth/choose_user.dart';
import 'package:health_monitoring_system/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/splash_bg.svg", fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const Spacer(),

                  const Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 75,
                        fontWeight: FontWeight.bold),
                  ),
                  // SvgPicture.asset(
                  //   "assets/icons/gerda_logo.svg",
                  // ),
                  const Spacer(),
                  // As you can see we need more padding on our btn
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseUser(),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen()//SignInScreen(),
                            )),
                        style: TextButton.styleFrom(

                          elevation: 0,
                          backgroundColor: Colors.cyan,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF6CD8D1)),
                          ),
                        ),
                        child: const Text("Sign In"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
