import 'package:flutter/material.dart';

class ChangeColor extends ChangeNotifier{
  Color color = Colors.black54;

  changeColors(Color colors){

    color = colors;
    notifyListeners();
  }
}