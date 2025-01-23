// core/localization/supported_languages.dart

import 'package:flutter/material.dart';

class SupportedLanguages {
  // List of supported languages (add the languages your app will support)
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'), // English
    Locale('es', 'ES'), // Spanish
    Locale('fr', 'FR'), // French
    Locale('de', 'DE'), // German
    Locale('ar', 'AE'), // Arabic
  ];

  // This is useful for language selection, e.g., for dropdowns or settings
  static const List<String> supportedLanguageNames = [
    'English',
    'Español',
    'Français',
    'Deutsch',
    'العربية', // Arabic
  ];

  // You can add a method to get the language code from the language name
  static String languageCodeFromName(String languageName) {
    switch (languageName) {
      case 'English':
        return 'en';
      case 'Español':
        return 'es';
      case 'Français':
        return 'fr';
      case 'Deutsch':
        return 'de';
      case 'العربية':
        return 'ar';
      default:
        return 'en'; // Default to English if not found
    }
  }
}
