import 'package:flutter/material.dart';
import 'package:flutter_http_demo/way1/Way_one.dart';
import 'package:flutter_http_demo/way2/Way_two.dart';
import 'package:flutter_http_demo/way3/Way_three.dart';
import 'package:http/http.dart' as http;

import 'Users.dart';


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
        body: Way_one(),
      ),
    );
  }
}



