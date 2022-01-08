import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_http_demo/ShowData_Card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_http_demo/way2/data.dart';
import 'package:json_helpers/json_helpers.dart';

class Way_two extends StatefulWidget {
  const Way_two({Key? key}) : super(key: key);

  @override
  _Way_twoState createState() => _Way_twoState();
}

class _Way_twoState extends State<Way_two> {
  List<Data> datalist=[];

  Future<List<Data>> getData()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        print(i['name']);
        datalist.add(Data.fromJson(i));
      }
      return datalist;
    }
    else{
      throw Exception("404 Not Found");
    }
  }
 /*
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    data=getData();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context,AsyncSnapshot<List<Data>> snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: datalist.length,
                        itemBuilder: (context,index){
                          return Show_Data_Card(
                              snapshot.data![index].name.toString(),
                              snapshot.data![index].username.toString(),
                              snapshot.data![index].email.toString(),
                              snapshot.data![index].address.city.toString(),
                              snapshot.data![index].address.geo.lat.toString(),
                          );
                        }
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text("${snapshot.error}"));
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
              },
            )
        )
      ],
    );
  }
}
