


import 'package:flutter/foundation.dart';

class BottomNavigationChangeNotifier extends ChangeNotifier{
  int _index = 0;
  int get currentIndex => _index;


  void setCurrentIndex(int selectedIndex){
    _index = selectedIndex;
    notifyListeners();
  }
}