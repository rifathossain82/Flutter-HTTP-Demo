import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_demo/Seat%20Layout%20JSON/Show_data.dart';

class First_Way extends StatefulWidget {
  const First_Way({Key? key}) : super(key: key);

  @override
  _First_WayState createState() => _First_WayState();
}

List<dynamic> data1 = [];
List<String> seat = [];

class _First_WayState extends State<First_Way> {
  Future<void> _getUsers() async {
    seat = [];
    data1 = [];
    var data = await DefaultAssetBundle.of(context)
        .loadString("jsonFile/Jsonfile.json");

    var jsonData = json.decode(data);
    //print(jsonData);
    for (var n in jsonData) {
      data1.add(n);
    }
    int mx = 0;
    //print(data1.length);
    for (var n in data1) {
      //to get highest length of list
      if (n is List) {
        //print('2');
        mx = n.length;
        for (var i in n) {
          if (i['t'] == 's') {
            //print(i['n']);
            seat.add(i['n']);
          } else {
            //print(i['t']);
            seat.add(i['t']);
          }
        }
      }

      //to get highest length of map
      if (n is Map) {
        //print('1');
        mx = n.length;
        //print(n.keys);
        //print(n.length);
        //if(n.key)
        //print(n['0']['t']);
        var rowKeys = n.keys;
        for (int i = 0; i < n.length; i++) {
          if (i == 1) {
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat.add(n['${rowKeys.elementAt(i)}']['n']);
            } else {
              seat.add(n['${rowKeys.elementAt(i)}']['t']);
            }
            seat.add('b');
          } else {
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat.add(n['${rowKeys.elementAt(i)}']['n']);
            } else {
              seat.add(n['${rowKeys.elementAt(i)}']['t']);
            }
          }
        }
      }
    }
    //print(mx);
    // print(mx*data1.length);
    print(seat);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                itemCount: seat.length,
                itemBuilder: (context, index) {
                  return Card(child: InkWell(onTap:(){print('You click ${seat[index]}');},child: Center(child: setText(seat[index]))));
                },
              ),
            ));
      },
    );
  }
}

Widget setText(txt) {
  return txt == 'b'
      ? Text(' ')
      : txt == 'do'
          ? Text('Door')
          : txt == 'c'
              ? Text(' ')
              : txt == 'dr'
                  ? Text('Driver')
                  : Text(txt);
}

/*
Fluttertoast.showToast(
                        msg: "You click ${seat[index]}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
 */
