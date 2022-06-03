import 'package:flutter/material.dart';
import 'package:health_monitoring_system/models/paitentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_monitoring_system/models/prescriptionModel.dart';

class PatientPrescription extends StatefulWidget {
 Patients _patients = Patients();

  PatientPrescription(this._patients,{Key? key}) : super(key: key);

  // static void set(Patients patients) => _patients = patients;

  @override
  State<PatientPrescription> createState() => _PatientPrescriptionState();
}

class _PatientPrescriptionState extends State<PatientPrescription> {
  PrescriptionModel _prescriptionModel = PrescriptionModel();

  final _databasePrescription =
      FirebaseFirestore.instance.collection('prescription');

  var _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prescriptions'),
          actions: [
            IconButton(
                onPressed: ()  async {

                    _data = await _fetch();

                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (_, index1) {
              return Container(
                  height: 20,
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _detailPrescription(context, _data[index1].data);
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        _data[index1].date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.normal),
                      )),
                    ),
                  ));
            }));
  }

  Future<List>_fetch() async {
    var data = [];
    setState(()  {
       _databasePrescription
          .where('uID', isEqualTo: widget._patients.uId)
          .get()
          .then((value) {
        for (var doc in value.docs) {
          _prescriptionModel.prescriptionID = doc.id;
          _prescriptionModel.uID = doc.data()['uID'];
          _prescriptionModel.data = doc.data()['prescription_list'];
          _prescriptionModel.date = doc.data()['date'];
          _prescriptionModel.time = doc.data()['time'];
          data.addAll(_prescriptionModel.data);
          print(_prescriptionModel.uID);
        }
      }).onError((error, stackTrace) {
        print(error);
      });
    });
    return data;
  }

  Widget _detailPrescription(context, List<dynamic> data) {
    return Flexible(
        flex: 1,
        child: Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text("${index + 1} : ${data[index]}"),
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          ),
        ));
  }
}
