import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier {
  Locale? _locale;
  bool _isLanguageSelected = false;

  Locale? get locale => _locale;
  bool get isLanguageSelected => _isLanguageSelected;

  LocalizationProvider() {
    _loadPreferredLanguage();
  }

  void setLocale(Locale locale) async {
    _locale = locale;
    _isLanguageSelected = true;
    notifyListeners();

    // Save preferred language to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', locale.languageCode);
    await prefs.setBool('isLanguageSelected', true);
  }

  void _loadPreferredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('preferred_language');
    print("Loaded Language Code: $languageCode");  // Debugging

    if (languageCode != null) {
      _locale = Locale(languageCode);
      _isLanguageSelected = true;
    }
    notifyListeners();  // Trigger the UI rebuild
  }


  void clearLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('preferred_language');
    await prefs.remove('isLanguageSelected');
    _locale = null;
    _isLanguageSelected = false;
    notifyListeners();
  }
}
