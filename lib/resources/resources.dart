import 'package:flutter/material.dart';
import 'package:sentimen/resources/assets.gen.dart' as assetgen;

class Resources {
  static AppColors color = AppColors();
  static final images = assetgen.Assets.lib.resources.images;
}

class AppColors {
  Color colorPrimaryLight = Color(0xff8EE5E6);
  Color colorPrimary = Color(0xff61C6DE); // hex color of #db0612
  Color colorSecondary = Color(0xff1791D0);
  Color colorAccent = Color(0xffcccccc);
  Color colorAccentDark = Color(0xff666666);

  Color colorTangerine = Color(0xFFfd8f0e);
  Color colorSalmon = Color(0xFFff6a6a);

  Color scaffoldColor = Color(0xFFF2F2F2);
  Color textColor = Color(0xff666666);
  Color subTextColor = Color(0xff304151).withOpacity(0.6);
  Color subHintColor = Color(0xff304151).withOpacity(0.4);
  Color textColorWhite = Colors.white;

  Color colorSilver = Color(0xffd0d6dc);
  Color linkColor = Color(0xff8EE5E6);
  Color silver = Color(0xffd8dde2);
  Color colorPaleGrey = Color(0xffecf3f7);
  Color colorMango = Color(0xffff9533);
  Color borderColor = Color(0xff304151).withOpacity(0.4);
  Color formBorderColor = Color(0xffc0c5d1);
  Color expanseBorderColor = Color(0xff304151).withOpacity(0.2);

  Color errorColor = Color(0xffdb0612).withOpacity(0.5);
  Color successColor = Color(0xff5cb85c);
  Color cloudyBlue = Color(0xffc0c5d1);
  Color darkGreyBlue = Color(0xff304151);
}
