import 'package:flutter/material.dart';

class Show_Data_Card extends StatelessWidget {

  String name,username,email,address,geo;
  Show_Data_Card(this.name,this.username,this.email,this.address,this.geo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text('Name')),
                  Expanded(child: Text(name)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('UserName')),
                  Expanded(child: Text(username)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Email')),
                  Expanded(child: Text(email)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Address')),
                  Expanded(child: Text(address)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Geo')),
                  Expanded(child: Text(geo)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
