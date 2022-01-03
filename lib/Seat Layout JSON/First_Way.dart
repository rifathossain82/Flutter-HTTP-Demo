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

///to store all json data
List<String> seat = [];
int mx = 1;

///to store all seat

class _First_WayState extends State<First_Way> {
  Future<void> _getUsers() async {
    seat = [];
    data1 = [];
    mx=1;
    var data = await DefaultAssetBundle.of(context)
        .loadString("jsonFile/Jsonfile.json");

    var jsonData = json.decode(data);
    //print(jsonData);
    for (var n in jsonData) {
      data1.add(n);
    }

    //ignore this
    for (var n in data1) {
      if (n is List) {
        mx = n.length;
        for (var i in n) {
          if (i['t'] == 's') {
            //if t==s (seat), then store seat title
            seat.add(i['n']);
          } else {
            seat.add(i['t']); //otherwise store seat type
          }
        }
      } //if data1 item is a list

      if (n is Map) {
        mx = n.length; //ignore this
        var rowKeys = n.keys; //to get all keys of current map data

        for (int i = 0; i < n.length; i++) {
          if (i == 1) {
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat.add(n['${rowKeys.elementAt(i)}']['n']);
            } else {
              seat.add(n['${rowKeys.elementAt(i)}']['t']);
            }
            seat.add('b'); //to set  Corridor later keys of 1
          } else {
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat.add(n['${rowKeys.elementAt(i)}']['n']);
            } else {
              seat.add(n['${rowKeys.elementAt(i)}']['t']);
            }
          }
        }
      } //if data1 item is a map
    }

    print(seat);
    await mx;
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              //to check it's on click action
              borderRadius: BorderRadius.circular(12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: mx),
                itemCount: seat.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: InkWell(
                          onTap: () {
                            print(
                                'You click ${seat[index]}'); //just print seat index
                          },
                          child: Center(
                            child: setText(seat[index]),
                          )));
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
