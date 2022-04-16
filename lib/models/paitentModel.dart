class Patients {
  String fName, mName, lName;
  DateTime birthDate;
  String address;
  String aadharNo;
  String contNo;
  String gender;
  String bloodGr;

  Patients(this.fName, this.mName, this.lName, this.gender, this.bloodGr,
      this.aadharNo, this.birthDate, this.contNo, this.address);

  List<Map<String, dynamic>> getMap() {
    List<Map<String, dynamic>> mapList = [];
    mapList.add({'FName': fName});
    mapList.add({'MName': mName});
    mapList.add({'LName': lName});
    mapList.add({'Gender': gender});
    mapList.add({'Blood': bloodGr});
    mapList.add({'Birth': birthDate});
    mapList.add({'Address': address});
    mapList.add({'Aadhar': aadharNo});
    mapList.add({'Contact': contNo});

    return mapList;
  }
}
