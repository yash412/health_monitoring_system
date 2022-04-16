import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_monitoring_system/models/doctorModel.dart';

class Database{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference doctorCollection = FirebaseFirestore.instance.collection('doctor');

  Future<void> addDoctor(Doctors doctors){
    return doctorCollection.add({

      'Name': doctors.drName,
      'gender': doctors.gender,
      'Aadhar no': doctors.aadharNo,
      'Contact': doctors.contNo,
      'Clini Address':doctors.address,
      'Password':doctors.password

    }).then((value) => print('User added 12')).catchError((error)=> print("ERROR Failed"+error));
  }

}