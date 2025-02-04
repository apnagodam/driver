import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) => LanguageNotifier());

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super("en");

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('language') ?? "en";
  }

  Future<void> setLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
    state = langCode;
  }
}