import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC, FRENCH}

const String ARABIC = "ar";
const String ENGLISH = "en";
const String FRENCH = "fr";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale ARABIC_LOCAL = Locale("ar","SA");
const Locale ENGLISH_LOCAL = Locale("en","US");
const Locale FRENCH_LOCAL = Locale("fr","FR");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.FRENCH:
        return FRENCH;
    }
  }

  String getTitle() {
    switch (this) {
      case LanguageType.ENGLISH:
        return AppStrings.english;
      case LanguageType.ARABIC:
        return AppStrings.arabic;
      case LanguageType.FRENCH:
        return AppStrings.french;
    }
  }

  Locale getLocale() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH_LOCAL;
      case LanguageType.ARABIC:
        return ARABIC_LOCAL;
      case LanguageType.FRENCH:
        return FRENCH_LOCAL;
    }
  }
}

extension LanguageValueExtension on String{
  LanguageType toLanguageType(){
    switch (this) {
      case ENGLISH:
        return LanguageType.ENGLISH;
      case ARABIC:
        return LanguageType.ARABIC;
      case FRENCH:
        return LanguageType.FRENCH;
      default:
        return LanguageType.ENGLISH;
    }
  }
}