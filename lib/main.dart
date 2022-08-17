import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_http_demo/Seat%20Layout%20JSON/First_Way.dart';
import 'package:flutter_http_demo/youtube_api_test/view/youtube_page.dart';
import 'package:http/http.dart' as http;

import 'Test4/Test4_Main.dart';
import 'Users.dart';
import 'location_demo/ui/All_Location.dart';


void main(){
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
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
        body: YoutubePage(),
      ),
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

