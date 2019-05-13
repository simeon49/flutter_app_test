import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class CustomLocalizations {
  CustomLocalizations(this.locale);

  final Locale locale;

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'title ^-^',
    },
    'zh': {
      'title': '标题 ^-^',
    }
  };

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomLocalizations);
  }

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}


class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {
  CustomLocalizationsDelegate();

  bool isSupported(Locale locale) {
    return ['en', 'zh'].indexOf(locale.languageCode) != -1;
  }

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return SynchronousFuture(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(old) => false;
}
