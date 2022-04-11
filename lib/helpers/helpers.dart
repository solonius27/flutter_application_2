import 'package:flutter/material.dart';
import 'package:flutter_application_2/helpers/sizeConfig.dart';

double calculateSize(double size) {
  var val = size / 8.53;
  return val * SizeConfig.heightMultiplier!;
}

Widget appText(String tx, double size,
    {FontWeight weight = FontWeight.w400,
    topmargin = 0.0,
    bottommargin = 0.0,
    leftmargin = 0.0,
    rightmargin = 0.0,
    TextAlign align = TextAlign.center,
    Color color = Colors.green,
    double? space,
    bool softwrap = true,
    TextOverflow? overflow,
    FontStyle fontStyle = FontStyle.normal}) {
  return Container(
    margin: EdgeInsets.only(
        top: calculateSize(topmargin),
        bottom: calculateSize(bottommargin),
        left: calculateSize(leftmargin),
        right: calculateSize(rightmargin)),
    child: Text(
      tx == null ? "" : tx,
      softWrap: softwrap,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        fontSize: calculateSize(size),
        fontWeight: weight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: space,
      ),
    ),
  );
}
