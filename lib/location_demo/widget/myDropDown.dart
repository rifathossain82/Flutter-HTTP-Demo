import 'package:flutter/material.dart';

Widget myDropDown(
    List<String> items,   //from main
    String value, //from main
    String hintText,
    void onChange(val) //from main
    )
{
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: DropdownButton<String>(
      icon: Icon(Icons.keyboard_arrow_down),
      elevation: 0,
      hint: Text(hintText),
      value: value,
      onChanged: (val){
        onChange(val);
      },
      items: items.map<DropdownMenuItem<String>>((String val){
        return DropdownMenuItem(
          child: Text(val,style: TextStyle(color: Colors.black),),
          value: val,
        );
      }).toList(),
      dropdownColor: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
