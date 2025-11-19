import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

enum SupportedFonts { courierNew, sanSerif, timesNewRoman, libreBaskerville, playFairDisplay, tangerine }

extension SupportedFontsExt on SupportedFonts {
  String get fontName {
    switch (this) {
      case SupportedFonts.courierNew:
        return "Courier New";
      case SupportedFonts.sanSerif:
        return "sans-serif";
      case SupportedFonts.timesNewRoman:
        return "Times New Roman";
      case SupportedFonts.libreBaskerville:
        return "Libre Baskerville";
      case SupportedFonts.playFairDisplay:
        return "Playfair Display";
      case SupportedFonts.tangerine:
        return "Tangerine";
    }
  }

  TextStyle get fontFamily {
    switch (this) {
      case SupportedFonts.courierNew:
        return TextStyle(fontFamily: "Courier");
      case SupportedFonts.sanSerif:
        return TextStyle(fontFamily: "sans-serif");
      case SupportedFonts.timesNewRoman:
        return TextStyle(fontFamily: "Times");
      case SupportedFonts.libreBaskerville:
        return GoogleFonts.libreBaskerville();
      case SupportedFonts.playFairDisplay:
        return GoogleFonts.playfairDisplay();
      case SupportedFonts.tangerine:
        return GoogleFonts.tangerine();
    }
  }

  CustomDropdownMenuItem<SupportedFonts> get dropDown => CustomDropdownMenuItem<SupportedFonts>(
        value: this,
        child: PointerInterceptor(
          child: Text(fontName, style: fontFamily),
        ),
      );

  bool get importScript =>
      ![SupportedFonts.courierNew, SupportedFonts.sanSerif, SupportedFonts.timesNewRoman].contains(this);

  static String get script {
    var fonts = SupportedFonts.values.where((element) => element.importScript).map((e) => e.fontName).join("|");
    return '<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=$fonts"/>';
  }
  static String get oldScript {
    var fonts = SupportedFonts.values.where((element) => element.importScript).map((e) => e.fontName).join("|");
    return '<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=$fonts">';
  }

  static SupportedFonts fromValue(String value) =>
      SupportedFonts.values.firstWhere((element) => element.fontName == value, orElse: () => SupportedFonts.sanSerif);
}
