import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_monitoring_system/models/prescriptionModel.dart';

class Prescription extends StatefulWidget {
  var userId;

  Prescription(this.userId,{Key? key}) : super(key: key);

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {

  List<DynamicWidget> listDynamic = [];
  List<String> data = [];
final db = FirebaseFirestore.instance.collection('prescription');
  Icon floatingIcon = const Icon(Icons.add);
final PrescriptionModel _prescriptionModel  = PrescriptionModel();

  addDynamic() {
    if (data.isNotEmpty) {
      floatingIcon = Icon(Icons.add);

      data = [];
      listDynamic = [];
    }
    setState(() {});

    listDynamic.add(DynamicWidget());
  }

  submitData() {
    floatingIcon = const Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
  }
  _buildPopupDialog(BuildContext context , massage){
    return AlertDialog(
      title: Text(massage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text('Prescription Added'),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget result = Flexible(
        flex: 1,
        child: Card(

          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Padding(
                padding:const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Container(
                      margin:const EdgeInsets.only(left: 10.0),
                      child: Text("${index + 1} : ${data[index]}"),
                    ),
                     const Divider()
                  ],
                ),
              );
            },
          ),

        )
    );

    Widget dynamicTextField =  Flexible(
      flex: 2,
      child:  ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton = RaisedButton(
      onPressed: submitData,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Submit Data'),
      ),
    );

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Prescription'),
          actions: [
            IconButton(onPressed:() {
              _prescriptionModel.uID = widget.userId;
              _prescriptionModel.data = data;
              db.add({
                'uID':_prescriptionModel.uID,
                'prescription_list':_prescriptionModel.data,
                'date':_prescriptionModel.date,
                'time':_prescriptionModel.time
              }).then((value){
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context, 'Done'));
              });
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.done))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              data.isEmpty ? dynamicTextField : result,
              data.isEmpty ? submitButton : Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),

      );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Add prescription'),
      ),
    );
  }
}
