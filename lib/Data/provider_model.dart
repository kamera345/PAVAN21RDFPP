import 'package:flutter/material.dart';

class ChangeColor extends ChangeNotifier{
  Color color = Colors.orange;

  changeColors(Color colors){

    color = colors;
    notifyListeners();
  }
}