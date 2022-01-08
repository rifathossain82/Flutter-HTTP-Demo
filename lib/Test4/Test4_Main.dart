import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ShowData_Card.dart';

class Test4 extends StatefulWidget {
  const Test4({Key? key}) : super(key: key);

  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  @override

  var data;
  Future<void> getData()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?fbclid=IwAR2ZCvOapdo35ZcrrHTLcAc6fNcWVQ08Gmz8uEGFW8yBKzDba2g-CR56OrU"));

    if(response.statusCode==200){
      data=jsonDecode(response.body.toString());
    }
    else{
      throw Exception("404 Not Found");
    }
  }


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
                          data[index]['albumId'].toString(),
                          data[index]['id'].toString(),
                          data[index]['title'].toString(),
                          data[index]['url'].toString(),
                          data[index]['thumbnailUrl'].toString(),
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
