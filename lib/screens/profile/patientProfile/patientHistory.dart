import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';

class PatientHistory extends StatefulWidget {
  Patients patients = Patients();

  PatientHistory(this.patients, {Key? key}) : super(key: key);


  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
// _getImage(var url){
//   final httpsReference = FirebaseStorage.instance.refFromURL(
//       url);
//  return httpsReference.getData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: ListView.builder(
          itemCount: widget.patients.histories.length,
          itemBuilder: (context, index) {
            return Image.network(widget.patients.histories[index][1]['url']);
          }),
    );
  }
}
