import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_monitoring_system/screens/auth/sign_up_screen.dart';

import '../../constants.dart';

class ChooseUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            // Now it takes 100% of our height
          ),
          userList(context),
        ],
      ),
    );
  }

  Widget userList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: defaultPadding * 2),
        TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen())),
            child: const Text('Doctor',
                style: TextStyle(
                    fontSize: 25.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54))),
        const SizedBox(height: defaultPadding * 2),
        const TextButton(
            onPressed: null,
            child: Text('Patient',
                style: TextStyle(
                    fontSize: 25.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54))),
        const SizedBox(height: defaultPadding * 2),
        const TextButton(
            onPressed: null,
            child: Text('Pathology LAB',
                style: TextStyle(
                    fontSize: 25.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)))
      ],
    );
  }
}
