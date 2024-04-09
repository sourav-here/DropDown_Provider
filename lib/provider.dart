import 'package:flutter/material.dart';

class Drop extends ChangeNotifier{

  var items = ['a','b','c'];
  String dropdownvalue = 'a';
  String hintText = '';

  dropdownfunction(){
    hintText = dropdownvalue;
    notifyListeners();
  }

}