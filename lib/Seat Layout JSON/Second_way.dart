import 'dart:convert';

import 'package:flutter/material.dart';

import 'Model.dart';


class Second_way extends StatefulWidget {
  const Second_way({Key? key}) : super(key: key);

  @override
  _Second_wayState createState() => _Second_wayState();
}

List<dynamic> data1 = [];

///to store all json data
int mx = 1;

List<Model> seat_model=[];

///to store all seat

class _Second_wayState extends State<Second_way> {

  Future<void> _getUsers() async {
    data1 = [];
    seat_model=[];
    mx=1;
    var data = await DefaultAssetBundle.of(context)
        .loadString("jsonFile/jsonFile2.json");

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
            seat_model.add(Model(i['t'], i['n'], i['sc']));
          }
          else if (i['t'] == 'c') {
            seat_model.add(Model('corridor', '', ''));
          }
          else {
            String s=seat_name(i['t']);
            seat_model.add(Model(i['t'], s, ''));
          }
        }
      } //if data1 item is a list

      if (n is Map) {
        mx = n.length; //ignore this
        var rowKeys = n.keys; //to get all keys of current map data

        for (int i = 0; i < n.length; i++) {
          if(i==1){
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat_model.add(Model(n['${rowKeys.elementAt(i)}']['t'], n['${rowKeys.elementAt(i)}']['n'], n['${rowKeys.elementAt(i)}']['sc']));
            } else {
              String s=seat_name(n['${rowKeys.elementAt(i)}']['t']);
              seat_model.add(Model(n['${rowKeys.elementAt(i)}']['t'], s,''));
            }
            seat_model.add(Model('corridor',' ',''));  // to set middle as a corridor
          }
          else{
            if (n['${rowKeys.elementAt(i)}']['t'] == 's') {
              seat_model.add(Model(n['${rowKeys.elementAt(i)}']['t'], n['${rowKeys.elementAt(i)}']['n'], n['${rowKeys.elementAt(i)}']['sc']));
            } else {
              String s=seat_name(n['${rowKeys.elementAt(i)}']['t']);
              seat_model.add(Model(n['${rowKeys.elementAt(i)}']['t'], s,''));
            }
          }
        }
      } //if data1 item is a map
    }

    // print(seat_model.length);
    // for(int i=0;i<seat_model.length;i++){
    //   print(seat_model[i].t+" - "+seat_model[i].n+" - "+seat_model[i].sc);
    // }

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
                itemCount: seat_model.length,
                itemBuilder: (context, index) {
                  return seat_model[index].t=='corridor'?Container():Card(
                      child: InkWell(
                          onTap: () {
                            print(
                                'You click ${seat_model[index].n}'); //just print seat index
                          },
                          child: Center(
                            child: Text(seat_model[index].n),
                          )));
                },
              ),
            ));
      },
    );
  }
}

String seat_name(txt){
  return txt == 'b'
      ? ' '
      : txt == 'do'
      ? 'Door'
      : txt == 'c'
      ? ' '
      : txt == 'dr'
      ? 'Driver'
      : txt;
}
