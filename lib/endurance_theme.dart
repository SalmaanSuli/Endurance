///
///Theme
///It made sense to make this class to be able to reuse the same fonts and colours throughout the app
///
///This class does a few things:
/// 1. Ability to switch between light and dark mode based on the users preferences
/// 2. As a prerequisite to the point above, we get shared preferences
/// 3. Stores theme styles for Text (font, color, weight, size)
/// 4. Stores theme colours
///
///Note: quite a good share of this class is borrowed code (especially the shared preferences and light/dark mode code)
///

//Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
//End Imports

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

//get Shared Preferences and figure out if it is light or dark mode
abstract class EnduranceTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  //So when the app shuts down, it is saved in the phone
  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static EnduranceTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color lineColor;
  late Color primaryWhite;
  late Color darkBG;
  late Color primaryBlack;

  //This creates a theme for text: font, color, weight, and size
  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

//Colours for light mode
class LightModeTheme extends EnduranceTheme {
  late Color primaryColor = const Color(0xFF2BC63D);
  late Color secondaryColor = const Color(0xFF9AC62B);
  late Color tertiaryColor = const Color(0xFF008775);
  late Color alternate = const Color(0xFF262D34);

  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color lineColor = Color(0xFFE0E3E7);
  late Color primaryWhite = Color(0xFFFFFFFF);
  late Color darkBG = Color(0xF1A1F24);
  late Color primaryBlack = Color(0xFF131619);
}

//Colors for dark mode
class DarkModeTheme extends EnduranceTheme {
  late Color primaryColor = const Color(0xFF2BC63D);
  late Color secondaryColor = const Color(0xFF9AC62B);
  late Color tertiaryColor = const Color(0xFF008775);
  late Color alternate = const Color(0xFF262D34);

  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color lineColor = Color(0xFFE0E3E7);
  late Color primaryWhite = Color(0xFFFFFFFF);
  late Color darkBG = Color(0xF1A1F24);
  late Color primaryBlack = Color(0xFF131619);
}

//Gets the font the user uses on their phone and copies it to the ap, for their convenience
extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
