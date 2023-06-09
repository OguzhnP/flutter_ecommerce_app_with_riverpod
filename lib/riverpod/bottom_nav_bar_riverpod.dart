import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_eticaret/views/basket/basket.dart';
import 'package:riverpod_eticaret/views/favorite/favorite.dart';
import 'package:riverpod_eticaret/views/home/home.dart';

class BotomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Anasayfa"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: "Favoriler"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Sepet"),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Favorite();
      case 2:
        return const Basket();
      default:
        return const Home();
    }
  }

  String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "Anasayfa";
      case 1:
        return "Favoriler";
      case 2:
        return "Sepet";
      default:
        return "Anasayfa";
    }
  }
}
