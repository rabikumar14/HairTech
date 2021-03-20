  import 'package:flutter/material.dart';

List<Widget> radioButtonList(
      List<String> filterList, Function valtoChange, Function groupValue) {
    return filterList
        .map((data) => RadioListTile(
              title: Text(
                data,
                style: TextStyle(fontSize: 14),
              ),
              groupValue: groupValue(),
              value: data,
              onChanged: (val) {
               
                  valtoChange(val);
                
              },
            ))
        .toList();
  }