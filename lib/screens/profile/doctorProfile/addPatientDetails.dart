import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../prescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPatientDetails extends StatelessWidget {

   AddPatientDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context,delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
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
              child: myProfile(context),
            ),
          )
        ],
      ),
    );
  }

  Widget myProfile(BuildContext buildContext) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20.0),
                // width: 200,
                // height: 200,
                // padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(child: Text('Add Prescription')),
                  ),
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (context) => Prescription()));
                  },
                )),
          ],
        ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{
  static List<Map<String , dynamic>> searchTerms =[] ;
  final db = FirebaseFirestore.instance.collection('patient').get().then((value) {
    for (var doc in value.docs) {
      searchTerms.add(doc.data());
    }
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){
       query = '';
     }, icon: const Icon(Icons.clear))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);

    }, icon: const Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
  List matchQuery = [];
  for(var patient in searchTerms){
    if(patient['Aadhar no'] == query){
      matchQuery.add(patient);
    }
  }
  return ListView.builder(itemCount: matchQuery.length,
  itemBuilder: (context , index){
    var result = matchQuery[index];
    return ListTile(
      title: Container(

            height: 100,
            width: 200,
          child: Card(
          child:Center(
            child: Row(
        children: [
            const SizedBox(height: 50,),
            Padding(
                padding:  const EdgeInsets.all(20.0),
                child :Text(result['Name'])),
            const SizedBox(width: 50),
            Container(
                width:100,
                child: Text(result['Contact'])),
            const SizedBox(width: 90,),
             Container(child: IconButton(onPressed: (){}, icon: const Icon(Icons.open_in_full))),

        ],
      ),
          ))),
    );
  },
  );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String , dynamic>> matchQuery = [];
    for(var patient in searchTerms){
      if(patient['Aadhar no'] == query){
        matchQuery.add(patient);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,
      itemBuilder: (context , index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result['Name']),
        );
      },
    );}

}
