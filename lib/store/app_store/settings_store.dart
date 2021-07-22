import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:kutilang_example/utils/themes/theme_services.dart';
import 'package:mobx/mobx.dart';

import 'preferences_service.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore(this._preferencesService) {
    useDarkMode = _preferencesService.useDarkMode;
  }


  final PreferencesService _preferencesService;

  @observable
  bool useDarkMode = false;

    @observable
  bool isLightTheme = true;

  @observable
  ThemeData theme =ThemeServices.lightTheme();

    @observable
  Locale locale = Locale('en', 'EN');


  String errorMessage = 'error';

  String userMessage = 'user message';

  String passwordMessage = 'user message';

  String forgotMessage = 'user message';
  bool showError = false;


  @action
  Future<void> setDarkMode({required bool value}) async {
    _preferencesService.useDarkMode = value;
    useDarkMode = value;
  }


  @action
  switchTheme(){
      isLightTheme = isLightTheme ?false:true;
     isLightTheme ? switchToLight() : switchToDark();
  }

  switchToDark() {
    FLog.info(text: 'dark');
    theme = ThemeServices.darkTheme();
  }

  switchToLight() {
    FLog.info(text: 'light');
    theme = ThemeServices.lightTheme();
  }

    @action
  Future<void> switchLocale(String flag) async {
    locale = Locale(flag.toLowerCase(), flag);
  }
}
