import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../model/bd_data.dart';

class AllLocation extends StatefulWidget {
  const AllLocation({Key? key}) : super(key: key);

  @override
  _AllLocationState createState() => _AllLocationState();
}

class _AllLocationState extends State<AllLocation> {

  //to show data in dropDown list
  List<String> divisionItemList=[];
  List<String> districtItemList=[];
  List<String> upazilaItemList=[];
  List<String> postCodeItemList=[];

  //to store dropdown selected item
  var selectedDivision;
  var selectedDistrict;
  var selectedUpazila;
  var selectedPostCode;

  //to store all info by class
  List<Division> divisionList=[];
  List<District> districtList=[];
  List<Upazila> upazilaList=[];
  List<PostCode> postCodeList=[];

  Future<void> getData()async{
    var data =  await DefaultAssetBundle.of(context).loadString("jsonFile/all_location.json");
    var jsonData = json.decode(data);

    //to fetch divisions data
    for(var n in jsonData['divisions']){
      divisionList.add(Division(n['id'], n['name'], n['bn_name'], n['lat'], n['long']));

      //create all division item list for drop down
      divisionItemList.add('${n['bn_name']} (${n['name']})');
    }

    //to fetch district data
    for(var n in jsonData['districts']){
      districtList.add(District(n['id'], n['division_id'], n['name'], n['bn_name'], n['lat'], n['long']));
    }

    //to fetch upazila data
    for(var n in jsonData['upazilas']){
      upazilaList.add(Upazila(n['id'], n['district_id'], n['name'], n['bn_name']));
    }

    //to fetch postCode data
    for(var n in jsonData['postcodes']){
      postCodeList.add(PostCode(n['division_id'], n['district_id'], n['upazila'], n['postOffice'], n['postCode']));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          ///to show division
          Row(
            children: [
              Text('Division',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  hint: Text('Select Division'),
                  value: selectedDivision,
                  onChanged: (val){
                    districtItemList=[];
                    setState(() {
                      selectedDivision=val;
                    });
                    findDistrict();
                  },
                  items: divisionItemList.map<DropdownMenuItem<String>>((String val){
                  return DropdownMenuItem(
                    child: Text(val,style: TextStyle(color: Colors.black),),
                    value: val,
                  );
                  }).toList(),
                  dropdownColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            ],
          ),

          ///to show district
          Row(
            children: [
              Text('District',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  hint: Text('Select District'),
                  value: selectedDistrict,
                  onChanged: (val){
                    upazilaItemList=[];
                    setState(() {
                      selectedDistrict=val;
                    });
                    findUpazila();
                  },
                  items: districtItemList.map<DropdownMenuItem<String>>((String val){
                    return DropdownMenuItem(
                      child: Text(val,style: TextStyle(color: Colors.black),),
                      value: val,
                    );
                  }).toList(),
                  dropdownColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            ],
          ),

          ///to show upazila
          Row(
            children: [
              Expanded(child: Text('Upazila',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),)),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  hint: Text('Select Upazila'),
                  value: selectedUpazila,
                  onChanged: (val){
                    postCodeItemList=[];
                    setState(() {
                      selectedUpazila=val;
                    });
                    findPostCode();
                  },
                  items: upazilaItemList.map<DropdownMenuItem<String>>((String val){
                    return DropdownMenuItem(
                      child: AutoSizeText(
                        val,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        maxFontSize: 14,
                      ),
                      value: val,
                    );
                  }).toList(),
                  dropdownColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            ],
          ),

          ///to show post code
          Row(
            children: [
              Text('Post Code',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  hint: Text('Select PostCode'),
                  value: selectedPostCode,
                  onChanged: (val){
                    setState(() {
                      selectedPostCode=val;
                    });
                  },
                  items: postCodeItemList.map<DropdownMenuItem<String>>((String val){
                    return DropdownMenuItem(
                      child: Text(val,style: TextStyle(color: Colors.black),),
                      value: val,
                    );
                  }).toList(),
                  dropdownColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


  void findDistrict(){
    selectedDistrict=null;
    selectedUpazila=null;
    selectedPostCode=null;
    upazilaItemList=[];
    postCodeItemList=[];

    for(int i=0; i< divisionList.length; i++){
      if(selectedDivision==(divisionList[i].bn_name + " (${divisionList[i].name})")){
        for(int j=0; j<districtList.length;j++){
          if(divisionList[i].id==districtList[j].division_id){
            districtItemList.add(districtList[j].bn_name + " (${districtList[j].name})");
          }
        }
      }
    }
  }

  void findUpazila(){
    selectedUpazila=null;
    selectedPostCode=null;
    postCodeItemList=[];
    for(int i=0; i< districtList.length; i++){
      if(selectedDistrict==(districtList[i].bn_name + " (${districtList[i].name})")){
        for(int j=0; j<upazilaList.length; j++){
          if(districtList[i].id==upazilaList[j].district_id){
            upazilaItemList.add(upazilaList[j].bn_name + " (${upazilaList[j].name})");
          }
        }
      }
    }
  }

  void findPostCode(){
    selectedPostCode=null;
    for(int i=0; i< upazilaList.length; i++){
      if(selectedUpazila==(upazilaList[i].bn_name + " (${upazilaList[i].name})")){
        for(int j=0; j<postCodeList.length; j++){
          if(upazilaList[i].name==postCodeList[j].upazila){
            postCodeItemList.add(postCodeList[j].postOffice.toString()+" ("+postCodeList[j].postCode.toString()+")");
          }
        }
      }
    }
  }
}
