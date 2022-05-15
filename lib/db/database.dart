import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_monitoring_system/models/doctorModel.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';
import 'package:health_monitoring_system/models/labModel.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('doctor');
  CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('patient');
  CollectionReference labCollection =
      FirebaseFirestore.instance.collection('labs');

  Future<Patients> fetchPatient(
      String collection, String aadhar, String pass) async {
    Patients patients = Patients();
    await firestore
        .collection(collection)
        .where('Aadhar no', isEqualTo: aadhar)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        if (pass == doc.data()['Password']) {
          patients.uId = doc.id;
          patients.name = doc.data()['Name'];
          patients.address = doc.data()['Address'];
          patients.aadharNo = doc.data()['Aadhar no'];
          patients.bloodGr = doc.data()['Blood Group'];
          patients.birthDate = doc.data()['Birth Date'];
          patients.gender = doc.data()['Gender'];
          patients.contNo = doc.data()['Contact'];
        }
      }
    });
    return patients;
  }

  fetchDoctor(String collection, String aadhar, String pass) async {
    Doctors doctor = Doctors();
    await firestore
        .collection(collection)
        .where('Aadhar no', isEqualTo: aadhar)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        if (pass == doc.data()['Password']) {
          doctor.docId = doc.id;
          doctor.drName = doc.data()['Name'];
          doctor.address = doc.data()['Clini Address'];
          doctor.aadharNo = doc.data()['Aadhar no'];
          doctor.gender = doc.data()['gender'];
          doctor.contNo = doc.data()['Contact'];
        }else{
          return "Something is wrong";
        }
      }
    });
    return doctor;
  }

  fetchLab(String collection, String aadhar, String pass) async {
    Labs lab = Labs();
    await firestore
        .collection(collection)
        .where('Aadhar no', isEqualTo: aadhar)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        if (pass == doc.data()['Password']) {
          lab.docId = doc.id;
          lab.labName = doc.data()['Name'];
          lab.address = doc.data()['Address'];
          lab.userName = doc.data()['User Name'];
          lab.contNo = doc.data()['Contact'];
        }
      }
    });
    return lab;
  }

  Future<void> addLab(Labs lab) {
    return labCollection
        .add({
          'Name': lab.labName,
          'User Name': lab.userName,
          'Contact': lab.contNo,
          'Address': lab.address,
          'Password': lab.password
        })
        .then((value) => print('User added 12'))
        .catchError((error) => print("ERROR Failed" + error));
  }

  Future<void> addPatient(Patients patients) {
    return patientCollection
        .add({
          'Name': patients.name,
          'Birth Date': patients.birthDate,
          'Blood Group': patients.bloodGr,
          'Gender': patients.gender,
          'Aadhar no': patients.aadharNo,
          'Contact': patients.contNo,
          'Address': patients.address,
          'Password': patients.password,
          // 'his_reports':FieldValue.arrayUnion(patients.histories)
        })
        .then((value) => print('User added 12'))
        .catchError((error) => print("ERROR Failed" + error));
  }

  Future<void> addDoctor(Doctors doctors) {
    return doctorCollection
        .add({
          'Name': doctors.drName,
          'gender': doctors.gender,
          'Aadhar no': doctors.aadharNo,
          'Contact': doctors.contNo,
          'Clini Address': doctors.address,
          'Password': doctors.password
        })
        .then((value) => print('User added 12'))
        .catchError((error) => print("ERROR Failed" + error));
  }
}
