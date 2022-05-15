class Doctors {

  late String drName;
  late String address;
  late String aadharNo;
  late String contNo;
  late String gender = 'male';
  late String password;
  late String docId;

  // Doctors(this.drName, this.gender, this.aadharNo,  this.contNo,
  //     this.address,this.password);

  List<Map<String, dynamic>> getMap() {
    List<Map<String, dynamic>> mapList = [];
    mapList.add({'Name': drName});
    mapList.add({'Gender': gender});
    mapList.add({'Address': address});
    mapList.add({'Aadhar': aadharNo});
    mapList.add({'Contact': contNo});

    return mapList;
  }


}
