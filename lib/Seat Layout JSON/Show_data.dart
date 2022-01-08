import 'package:flutter/material.dart';

class Show_data extends StatelessWidget {
  String c1,c2,c3,c4,c5;


  Show_data(this.c1, this.c2, this.c3, this.c4, this.c5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: c1=='do'?Text('Door'):Text(c1)),
            ))),
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: c2=='b'?Text(' '):Text(c2)),
            ))),
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: c3=='c'?Text(' '):Text(c3)),
            ))),
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: c4=='b'?Text(' '):Text(c4)),
            ))),
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: c5=='dr'?Text('Driver'):Text(c5)),
            ))),
          ],
        ),
      ],
    );
  }
}
