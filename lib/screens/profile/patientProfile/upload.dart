import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadDocument extends StatefulWidget {
  final db;
  UploadDocument(this.db, {Key? key}) : super(key: key);
  // List<Map<String , dynamic>> urls = [];

  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  /// Variables
  File? imageFile;

  List<Map<String, dynamic>> urls = [];

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
              child: SingleChildScrollView(child: upload(widget.db)),
            ),
          )
        ],
      ),
    );
  }

  Widget upload(db) {
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
                      child: const Text("PICK FROM GALLERY"),
                    ),
                    Container(
                      height: 40.0,
                    ),
                    RaisedButton(
                      color: Colors.lightGreenAccent,
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: const Text("PICK FROM CAMERA"),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 700,
                    width: 900,
                    child: Image.file(
                      imageFile!,
                      height: 600,
                      width: 900,
                    ),
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _uploadInDatabase();
                    },
                    child: const Text("Upload"),
                  )
                ],
              ));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 900,
      maxHeight: 700,
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
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _uploadInDatabase() async {
    final _storage = FirebaseStorage.instance;
    final _db = FirebaseFirestore.instance;
    if (imageFile != null) {
      var snapshot = await _storage
          .ref()
          .child('userReportsHistory/imageName')
          .putFile(imageFile!);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        urls.add({"imageName": 'name', 'url': downloadUrl});
        _db.collection('patient').doc('a4USOOrGWP5f8ss6d1h6').update({'history':urls});
      });
    }
  }
}
