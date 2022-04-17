import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';


class UploadDocument extends StatefulWidget {
  const UploadDocument({Key? key}) : super(key: key);
  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}
class _UploadDocumentState extends State<UploadDocument> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Upload Documents"),
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
                child: upload(),
              ),
            )
          ],
        ),);
  }
Widget upload(){
    return Container(
  child: imageFile == null
  ? Container(
  alignment: Alignment.center,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  RaisedButton(
  color: Colors.greenAccent,
  onPressed: () {
  _getFromGallery();
  },
  child: Text("PICK FROM GALLERY"),
  ),
  Container(
  height: 40.0,
  ),
  RaisedButton(
  color: Colors.lightGreenAccent,
  onPressed: () {
  _getFromCamera();
  },
  child: Text("PICK FROM CAMERA"),
  )
  ],
  ),
  ): Container(
  child: Image.file(
  imageFile!,
  fit: BoxFit.cover,
  ),
  ));}
  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}