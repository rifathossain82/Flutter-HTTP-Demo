import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Test4/Test4_Main.dart';
import 'Users.dart';
import 'location_demo/ui/All_Location.dart';


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
        body: AllLocation(),
      ),
    );
  }
}



