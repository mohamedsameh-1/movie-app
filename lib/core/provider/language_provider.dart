import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isEnglish = true;

  void changeLanguage(bool value) {
    isEnglish = value;
    notifyListeners();
  }
}
