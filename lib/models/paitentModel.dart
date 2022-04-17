class Patients {
  late String name;
  late String  birthDate;
  late String address;
  late String aadharNo;
  late String contNo;
  String gender = 'male';
  String bloodGr = 'A+';
  late String password;

  // Patients(this.name, this.gender, this.bloodGr, this.aadharNo, this.birthDate,
  //     this.contNo, this.address, this.password);

  List<Map<String, dynamic>> getMap() {
    List<Map<String, dynamic>> mapList = [];
    mapList.add({'Name': name});
    mapList.add({'Gender': gender});
    mapList.add({'Blood': bloodGr});
    mapList.add({'Password': password});
    mapList.add({'Birth': birthDate});
    mapList.add({'Address': address});
    mapList.add({'Aadhar': aadharNo});
    mapList.add({'Contact': contNo});

    return mapList;
  }
}
