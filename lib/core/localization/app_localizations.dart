// core/localization/app_localizations.dart
import 'package:flutter/material.dart';

class AppLocalizations {
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Welcome',
      'greeting': 'Hello!',
    },
    'es': {
      'title': 'Bienvenido',
      'greeting': '¡Hola!',
    },
  };

  static String? of(BuildContext context, String key) {
    String languageCode = Localizations.localeOf(context).languageCode;
    return _localizedValues[languageCode]?[key];
  }
}
