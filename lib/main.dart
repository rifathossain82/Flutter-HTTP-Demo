import 'package:flutter/material.dart';
import 'package:flutter_http_demo/Seat%20Layout%20JSON/First_Way.dart';
import 'package:flutter_http_demo/Seat%20Layout%20JSON/Second_way.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter HTTP Demo'),
        ),
        body: Second_way(),
      ),
    );
  }
}



