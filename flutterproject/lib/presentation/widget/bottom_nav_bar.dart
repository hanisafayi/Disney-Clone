import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/screen/available_cars.dart';
import 'package:flutterproject/presentation/screen/regScreen.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';
import 'package:flutterproject/presentation/widget/bottom_nav_item.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

Widget buildBottomNavBar(int currIndex, Size size, ThemeData themeData) {
  return BottomNavigationBar(
    iconSize: size.width * 0.07,
    elevation: 0,
    selectedLabelStyle: const TextStyle(fontSize: 0),
    unselectedLabelStyle: const TextStyle(fontSize: 0),
    currentIndex: currIndex,
    backgroundColor: const Color(0x00ffffff),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: themeData.brightness == Brightness.dark
        ? Colors.indigoAccent
        : Colors.black,
    unselectedItemColor: const Color(0xff3b22a1),
    onTap: (value) {
      if (value != currIndex) {
        if (value == 1) {
          Get.off(Showroom());
        }
      }
    },
    items: [
      buildBottomNavItem(UniconsLine.car, themeData, size, GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
              MaterialPageRoute(builder: (context) => AvailableCars()));
        },
      )),
      buildBottomNavItem(UniconsLine.sign_out_alt, themeData, size,
          GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
              MaterialPageRoute(builder: (context) => RegScreen()));
        },
      )),
      buildBottomNavItem(UniconsLine.arrow_up, themeData, size, GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
              MaterialPageRoute(builder: (context) => AvailableCars()));
        },
      )),
    ],
  );
}
