import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_demo/ShowData_Card.dart';
import 'package:http/http.dart' as http;

class Way_one extends StatefulWidget {
  const Way_one({Key? key}) : super(key: key);

  @override
  _Way_oneState createState() => _Way_oneState();
}

class _Way_oneState extends State<Way_one> {


  var data;
  Future<void> getData()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode==200){
      data=jsonDecode(response.body.toString());
    }
    else{
      throw Exception("404 Not Found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                else{
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context,index){
                      return Show_Data_Card(
                          data[index]['name'].toString(),
                          data[index]['username'].toString(),
                          data[index]['email'].toString(),
                          data[index]['address']['city'].toString(),
                          data[index]['address']['geo']['lat'].toString(),
                      );
                      }
                  );
                }
              },
            )
        )
      ],
    );
  }
}
