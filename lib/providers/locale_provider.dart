import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  final String _prefKey = 'selected_locale';

  Locale? get locale => _locale;

  Future<void> loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print('SharedPreferences instance obtained');

      final localeCode = prefs.getString(_prefKey);
      print('Retrieved locale code from storage: $localeCode');

      if (localeCode == null) {
        print('No saved locale, using device default');
        final deviceLocale = WidgetsBinding.instance.window.locale;
        _locale =
            supportedLocales.contains(deviceLocale)
                ? deviceLocale
                : Locale('en');
      } else {
        print('Setting locale from saved value: $localeCode');
        _locale = Locale(localeCode);
      }

      notifyListeners();
    } catch (e) {
      print('Error loading locale: $e');
      _locale = Locale('en'); // Fallback
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale?.languageCode == locale.languageCode) return;

    _locale = locale;
    notifyListeners(); // This triggers rebuild

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, locale.languageCode);
      debugPrint('Locale saved: ${locale.languageCode}');
    } catch (e) {
      debugPrint('Save error: $e');
    }
  }

  Future<void> debugCheckStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_prefKey);
    print('Currently saved locale: $savedLocale');
    print('Current provider locale: ${_locale?.languageCode}');
  }

  final List<Locale> supportedLocales = const [Locale('en'), Locale('am')];
}
