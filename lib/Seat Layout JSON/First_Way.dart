import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_demo/Seat%20Layout%20JSON/Show_data.dart';
import 'package:flutter_http_demo/ShowData_Card.dart';

class First_Way extends StatefulWidget {
  const First_Way({Key? key}) : super(key: key);

  @override
  _First_WayState createState() => _First_WayState();
}

List<dynamic> data1=[];

class _First_WayState extends State<First_Way> {

  Future<void> _getUsers() async {
    var data =  await DefaultAssetBundle.of(context).loadString("jsonFile/jsonFile2.json");

    var jsonData = json.decode(data);
    //print(jsonData);
    for(var n in jsonData){
      data1.add(n);
    }
    print(data1[5]['1']['t']);

    getdata();
  }

  List<String> c1=[];
  List<String> c2=[];
  List<String> c3=[];
  List<String> c4=[];
  List<String> c5=[];

  int x=0;
  void getdata(){
    // c5.clear();
    // c4.clear();
    // c3.clear();
    // c2.clear();
    // c1.clear();
    //x=0;
    //x=data1.length-1;
    //print('length : $x');
    for(int i=0;i<data1.length;i++){
      //print(data1.length);
      if(i==0){

        if(data1[i][0]['t']=='s'){
          c1.add(data1[i][0]['n']);
        }
        if(data1[i][0]['t']=='do' || data1[i][0]['t']=='c' || data1[i][0]['t']=='b'  || data1[i][0]['t']=='dr'){
          c1.add(data1[i][0]['t']);
        }

        if(data1[i][1]['t']=='s'){
          c2.add(data1[i][1]['n']);
        }
        if(data1[i][1]['t']=='do' || data1[i][1]['t']=='c' || data1[i][1]['t']=='b'  || data1[i][1]['t']=='dr'){
          c2.add(data1[i][1]['t']);
        }

        if(data1[i][2]['t']=='s'){
          c3.add(data1[i][2]['n']);
        }
        if(data1[i][2]['t']=='do' || data1[i][2]['t']=='c' || data1[i][2]['t']=='b'  || data1[i][2]['t']=='dr'){
          c3.add(data1[i][2]['t']);
        }

        if(data1[i][3]['t']=='s'){
          c4.add(data1[i][3]['n']);
        }
        if(data1[i][3]['t']=='do' || data1[i][3]['t']=='c' || data1[i][3]['t']=='b'  || data1[i][3]['t']=='dr'){
          c4.add(data1[i][3]['t']);
        }

        if(data1[i][4]['t']=='s'){
          c5.add(data1[i][4]['n']);
        }
        if(data1[i][4]['t']=='do' || data1[i][4]['t']=='c' || data1[i][4]['t']=='b'  || data1[i][4]['t']=='dr'){
          c5.add(data1[i][4]['t']);
        }
      }
      else if(i==data1.length-1){
        // c1.add(data1[i][0]['t']);
        // c2.add(data1[i][1]['t']);
        // c3.add(data1[i][2]['t']);
        // c4.add(data1[i][3]['t']);
        // c5.add(data1[i][4]['t']);

        if(data1[i][0]['t']=='s'){
          c1.add(data1[i][0]['n']);
        }
        if(data1[i][0]['t']=='do' || data1[i][0]['t']=='c' || data1[i][0]['t']=='b'  || data1[i][0]['t']=='dr'){
          c1.add(data1[i][0]['t']);
        }

        if(data1[i][1]['t']=='s'){
          c2.add(data1[i][1]['n']);
        }
        if(data1[i][1]['t']=='do' || data1[i][1]['t']=='c' || data1[i][1]['t']=='b'  || data1[i][1]['t']=='dr'){
          c2.add(data1[i][1]['t']);
        }

        if(data1[i][2]['t']=='s'){
          c3.add(data1[i][2]['n']);
        }
        if(data1[i][2]['t']=='do' || data1[i][2]['t']=='c' || data1[i][2]['t']=='b'  || data1[i][2]['t']=='dr'){
          c3.add(data1[i][2]['t']);
        }

        if(data1[i][3]['t']=='s'){
          c4.add(data1[i][3]['n']);
        }
        if(data1[i][3]['t']=='do' || data1[i][3]['t']=='c' || data1[i][3]['t']=='b'  || data1[i][3]['t']=='dr'){
          c4.add(data1[i][3]['t']);
        }

        if(data1[i][4]['t']=='s'){
          c5.add(data1[i][4]['n']);
        }
        if(data1[i][4]['t']=='do' || data1[i][4]['t']=='c' || data1[i][4]['t']=='b'  || data1[i][4]['t']=='dr'){
          c5.add(data1[i][4]['t']);
        }

      }
      else{

        if(data1[i]['0']['t']=='s'){
          c1.add(data1[i]['0']['n']);
        }
        if(data1[i]['0']['t']=='do' || data1[i]['0']['t']=='c' || data1[i]['0']['t']=='b'  || data1[i]['0']['t']=='dr'){
          c1.add(data1[i]['0']['t']);
        }

        if(data1[i]['1']['t']=='s'){
          c2.add(data1[i]['1']['n']);
        }
        if(data1[i]['1']['t']=='do' || data1[i]['1']['t']=='c' || data1[i]['1']['t']=='b'  || data1[i]['1']['t']=='dr'){
          c2.add(data1[i]['1']['t']);
        }

          c3.add(' ');

        if(data1[i]['3']['t']=='s'){
          c4.add(data1[i]['3']['n']);
        }
        if(data1[i]['3']['t']=='do' || data1[i]['3']['t']=='c' || data1[i]['3']['t']=='b'  || data1[i]['3']['t']=='dr'){
          c4.add(data1[i]['3']['t']);
        }

        if(data1[i]['4']['t']=='s'){
          c5.add(data1[i]['4']['n']);
        }
        if(data1[i]['4']['t']=='do' || data1[i]['4']['t']=='c' || data1[i]['4']['t']=='b'  || data1[i]['4']['t']=='dr'){
          c5.add(data1[i]['4']['t']);
        }
      }
    }
    //print(c5.length);
    //print(data1.length-1);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
        builder: (context,snapshot){
           return Padding(
             padding: const EdgeInsets.all(12.0),
             child: ListView.builder(
                itemCount: c5.length,
                itemBuilder: (context,index){
                  return Show_data(
                    c1[index],
                    c2[index],
                    c3[index],
                    c4[index],
                    c5[index],
                  )
                  ;
                }
          ),
           );
        },

    );
  }
}
