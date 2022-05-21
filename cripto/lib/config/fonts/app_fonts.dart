
import 'package:flutter/material.dart';

extension AppFonts on Text {
  
  Text title([Color? color]) {
    TextStyle customStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: color ?? Colors.black,
    );
    return _generateText(customStyle, this);
  }
  
  Text subtitle([Color? color]) {
    TextStyle customStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
    return _generateText(customStyle, this);
  }
  
  Text body([Color? color]) {
    TextStyle customStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
    return _generateText(customStyle, this);
  }
  
  Text caption([Color? color]) {
    TextStyle customStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
    return _generateText(customStyle, this);
  }
}

Text _generateText(TextStyle style, Text text) {
  return Text(
      text.data!,
      key: text.key,
      style: style,
      strutStyle: text.strutStyle,
      textAlign: text.textAlign,
      textDirection: text.textDirection,
      locale: text.locale,
      softWrap: text.softWrap,
      overflow: text.overflow,
      textScaleFactor: text.textScaleFactor,
      maxLines: text.maxLines,
      semanticsLabel: text.semanticsLabel,
      textWidthBasis: text.textWidthBasis,
      textHeightBehavior: text.textHeightBehavior,
    );
  }