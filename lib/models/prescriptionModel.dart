import 'package:intl/intl.dart';

class PrescriptionModel{
 late String prescriptionID;
 late String  uID;
  List<dynamic> data = [];
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String time =DateFormat("HH:mm:ss").format(DateTime.now());
}