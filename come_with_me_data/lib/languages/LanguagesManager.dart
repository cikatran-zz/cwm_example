import 'dart:async';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:come_with_me_data/languages/builder/EnLangBuilder.dart';
import 'package:come_with_me_data/languages/builder/LangBuilder.dart';
import 'package:come_with_me_data/languages/builder/ViLangBuilder.dart';
import 'package:flutter/material.dart';

class LanguagesManager {
//   AppStorage appStorage = AppStorage();
  List<LangBuilder> _langBuilders = [EnLangBuilder(), ViLangBuilder()];
  LangBuilder _currentLangBuilder = ViLangBuilder();

  VoidCallback _onLocaleChangedCallback;

  SharedPreferences _preferences;

  LangBuilder get language => _currentLangBuilder;

  List<Locale> get supportedLocales => _langBuilders
      .map((lang) => Locale(lang.getLanguageCode(), lang.getCountryCode()))
      .toList();

  get currentLanguage => _currentLangBuilder.getLocale();

  Future<Null> init([String language]) async {
    _preferences = await SharedPreferences.getInstance();
    String cachedLanguage = _preferences.getString("language");
    _currentLangBuilder = cachedLanguage == EnLangBuilder().getLocale()
        ? EnLangBuilder()
        : ViLangBuilder();
    await setNewLanguage();
    return null;
  }

  getPreferredLanguage() async {
    // return appStorage?.getString("language") ?? ViLangBuilder().getLocale();
  }

  setPreferredLanguage(String lang) async {
    // AppStorage().setString("language", lang);
    // AppStorage().setString("sys_lang", lang.substring(0, 2));
  }

  Future<Null> setNewLanguage(
      [String newLanguage, bool saveInPrefs = true]) async {
    String language = newLanguage;

    if (language == null) {
      language = await getPreferredLanguage();
    }
    if (language == "") {
      language = _currentLangBuilder.getLocale();
    }

    _currentLangBuilder = getLangBuilder(language);

    if (saveInPrefs) {
      await setPreferredLanguage(language);
    }
    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback();
    }

    return null;
  }

  LangBuilder getLangBuilder(String locale) {
    var langBuilder =
        _langBuilders.firstWhere((lang) => lang.getLocale() == locale);
    return langBuilder ?? _currentLangBuilder;
  }

  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  static final LanguagesManager _languagesManager =
      LanguagesManager._internal();

  factory LanguagesManager() {
    return _languagesManager;
  }

  LanguagesManager._internal();
}

//class LocalesDelegate extends LocalizationsDelegate<GlobalLocales> {
//  const LocalesDelegate();
//
//  @override
//  bool isSupported(Locale locale) =>
//      locales.supportedLocales().contains(locale);
//
//  @override
//  Future<GlobalLocales> load(Locale locale) =>
//      locales.setNewLanguage(locale.languageCode);
//
//  @override
//  bool shouldReload(LocalesDelegate old) => false;
//}

final LanguagesManager locale = LanguagesManager();
