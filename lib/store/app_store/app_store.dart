import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:kutilang_example/utils/themes/theme_services.dart';

import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  _AppStore() {
    reaction((_) => isLightTheme, switchTheme);
  }

  /*  @observable
  String locale = 'en'; */

  @observable
  bool isLightTheme = false;

  bool isLocale = true;

  @observable
  ThemeData? theme;

  @observable
  Locale? locale = Locale('id', 'ID');

  String errorMessage = 'error';

  String userMessage = 'user message';

  String passwordMessage = 'user message';

  String forgotMessage = 'user message';
  bool showError = false;

  @action
  switchLocale(String flag) {
    FLog.info(text: flag);
    locale = Locale(flag.toLowerCase(), flag);
    FLog.info(text: locale.toString());
  }

  @action
  forgotPassword() {}

  @action
  login() {}

  @action
  switchTheme(bool value) {
    isLightTheme ? switchToLight() : switchToDark();
  }

  @action
  switchToDark() {
    FLog.info(text: 'dark');

    theme = ThemeServices.darkTheme();
    isLightTheme = false;
  }

  @action
  switchToLight() {
    FLog.info(text: 'light');

    theme = ThemeServices.lightTheme();
    isLightTheme = true;
  }

  @action
  toggleTheme() {}

  /* @action
  goTo(String route) {
    NavigationServices.navigateTo(route);
  } */

  @action
  goTo(int index) {
    switch (index) {
      case 0:
        NavigationServices.navigateTo(AppsRoutes.home);
        break;
      default:
    }
  }
}
