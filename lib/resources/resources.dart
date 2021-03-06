import 'package:flutter/material.dart';
import 'package:sentimen/resources/assets.gen.dart' as assetgen;

class Resources {
  static AppColors color = AppColors();
  static final images = assetgen.Assets.lib.resources.images;
}

class AppColors {
  Color scaffoldColor = Colors.white; //Color(0xFFF2F2F2);
  Color scaffoldDarkColor = Color(0xFF2c2a2e);

  Color dropdownDarkButtonColor = Color(0xFF514f55);
  Color dropdownTextDarkButtonColor = Color(0xFFe0e0e0);

  Color formDarkColor = Color(0xFF514f55);
  Color formColor = Color(0xff61C6DE).withOpacity(0.3);

  Color tableTextHeaderColor = Color(0xFFafafaf);
  Color tableTextBodyColor = Color(0xFF6b6b6b);

  Color formFieldDarkColor = Color(0xFF201f21);
  Color formFieldColor = Colors.white;

  Color textColorDark = Color(0xFFafafaf);
  Color subTextColorDark = Color(0xFF6b6b6b);

  Color borderColor = Color(0xff304151).withOpacity(0.4);
  Color borderDarkColor = Color(0xff514F55);

  Color shadowColor = Colors.blueGrey.withOpacity(0.4);
  Color shadowDarkColor = Color(0xff1C1B1E);

  Color colorPrimaryLight = Color(0xff8EE5E6);
  Color colorPrimary = Color(0xff61C6DE);
  Color colorSecondary = Color(0xff1791D0);
  Color colorSecondaryDark = Colors.blue.shade900;
  Color colorAccent = Color(0xffcccccc);
  Color colorAccentDark = Color(0xff666666);

  Color colorTangerine = Color(0xFFfd8f0e);
  Color colorSalmon = Color(0xFFff6a6a);

  Color textColor = Color(0xff666666);
  Color subTextColor = Color(0xff666666).withOpacity(0.6);
  Color subHintColor = Color(0xff666666).withOpacity(0.4);
  Color textColorWhite = Colors.white;
  Color white = Colors.white;

  Color colorSilver = Color(0xffd0d6dc);
  Color linkColor = Color(0xff8EE5E6);
  Color silver = Color(0xffd8dde2);
  Color colorPaleGrey = Color(0xffecf3f7);
  Color colorMango = Color(0xffff9533);
  Color formBorderColor = Color(0xffc0c5d1);
  Color expanseBorderColor = Color(0xff304151).withOpacity(0.2);

  Color errorColor = Color(0xffdb0612).withOpacity(0.5);
  Color successColor = Color(0xff5cb85c);
  Color cloudyBlue = Color(0xffc0c5d1);
  Color darkGreyBlue = Color(0xff304151);

  //socmed
  Color twitter = Color(0xff03A9F4);
  Color youtube = Color(0xffFF3D00);
  Color instagram = Color(0xff8342B7);
  Color facebook = Color(0xff3F51B5);
  Color tiktok = Color(0xff212121);
  Color web = Color(0xffEAB63C);
}
