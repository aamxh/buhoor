import 'package:flutter/material.dart';
import 'package:buhoor/core/common/constants.dart';

class MyTheme {
  static final myLightTheme = ThemeData.light().copyWith(
    primaryColor: MyConstants.primaryC,
  );
  static final myDarkTheme = ThemeData.dark().copyWith(
    primaryColor: MyConstants.primaryC,
  );
}