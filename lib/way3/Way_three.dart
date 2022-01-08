import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ShowData_Card.dart';
import 'comments.dart';

class Way_three extends StatefulWidget {
  const Way_three({Key? key}) : super(key: key);

  @override
  _Way_threeState createState() => _Way_threeState();
}

List<Comments> commentsList=[];

Future<List<Comments>> getData()async{
  final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
  var data=jsonDecode(response.body.toString());
  if(response.statusCode==200){
    for(Map i in data){
      commentsList.add(Comments.fromJson(i));
    }
    return commentsList;
  }
  else{
    throw Exception("404 Not Found");
  }
}



class _Way_threeState extends State<Way_three> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context,AsyncSnapshot<List<Comments>> snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: commentsList.length,
                      itemBuilder: (context,index){
                        return Show_Data_Card(
                          snapshot.data![index].postId.toString(),
                          snapshot.data![index].id.toString(),
                          snapshot.data![index].name.toString(),
                          snapshot.data![index].email.toString(),
                          snapshot.data![index].body.toString(),
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
