import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<bool> _likedStatusList = List<bool>.generate(10, (index) => false);

  List<bool> get getLikedStatus => _likedStatusList;

  set setLikedStatus(int index) {
    print('log: $index');
    _likedStatusList[index] = !_likedStatusList[index];
    notifyListeners();
  }
}
