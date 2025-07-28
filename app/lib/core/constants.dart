import 'package:flutter/material.dart';

class MyConstants {

  MyConstants._();

  static final primaryColor = Color(0xff754f3d);
  static final errorColor = Color(0xffb02727);

}

enum Type {
  general,
  short,
  praise,
  romance,
  satire,
  sad,
  reproach,
  elegy,
  ghazal,
  religious,
  longing,
  mann,
  farewell,
  wisdom,
  dispraise,
  advice,
  homeland,
  sabr,
  ibtihal,
  chant,
  mercy,
  justice,
  apology,
  political,
  generosity,
  mualaqat,
  unclassified
}

enum Era {
  jahili,
  islamic,
  umayyad,
  abbasi,
  andalusian,
  ayoubi,
  mamluk,
  ottoman,
  late
}

enum Meter {
  tawil,
  khafif,
  rajz,
  ramal,
  sarie,
  basit,
  kamil,
  mutadarak,
  mutakarib,
  mujtath,
  madid,
  mudari,
  muqtadab,
  munsarih,
  hazaj,
  wafir
}