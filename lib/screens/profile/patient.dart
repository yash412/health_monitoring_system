

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../auth/components/upload.dart';

class PatientHomeScreen extends StatelessWidget {
  String user = "Name";

  PatientHomeScreen(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + user),
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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Center(
                      child: Text(
                        'History',
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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Center(
                      child: Text(
                        'Setting',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.normal),
                      )),
                )),
          ],
        ),
        Row(
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
                        'Prescription',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.normal),
                      )),
                )),
            // Container(
            //     width: 180,
            //     height: 180,
            //     padding: const EdgeInsets.all(20.0),
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       child: const Center(
            //           child: Text(
            //         'Upload',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 17,
            //             fontStyle: FontStyle.normal),
            //       )),
            //     ),),





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
                  child:const Center(child: Text('Upload Document')),

                ),onTap:(){
                  Navigator.push(buildContext,MaterialPageRoute(builder: (context) => const UploadDocument()));
                } ,)),
          ],
        ),
      ],
    );
  }
}
