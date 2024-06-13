import 'package:flutter/material.dart';

class FunctionsProvider extends ChangeNotifier {
  int likes=0;
  bool clicked=false;
  List<String> comments=[];
  void increment(){
    clicked=!clicked;
    likes++;
    notifyListeners();
  }
  void commentPost(String comment){
    comments.add(comment);
    notifyListeners();
    print(comments);
  }
}