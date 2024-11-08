import 'package:flutter/material.dart';

class MenuuController extends ChangeNotifier{
   
   // Private field for index
  int _index = 0;

  // Getter for index
  int get index => _index;

  // Setter for index with notifyListeners to make it reactive
  set index(int newIndex) {
    if (_index != newIndex) {
      _index = newIndex;
      notifyListeners(); // Notify listeners when index changes
    }
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _globalKey;

  void controlMenu(){
    if(!_globalKey.currentState!.isDrawerOpen){
      _globalKey.currentState?.openDrawer();
    }
  }
}