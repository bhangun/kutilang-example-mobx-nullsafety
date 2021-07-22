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
   // reaction((_) => isLightTheme, switchTheme);
  }

  /*  @observable
  String locale = 'en'; */

  @observable
  bool isLightTheme = true;

  bool isLocale = true;

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
  Future<void> switchLocale(String flag) async {
    locale = Locale(flag.toLowerCase(), flag);
  }

  @action
  forgotPassword() {}

  @action
  login() {}

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
  goTo(int index) {
    switch (index) {
      case 0:
        NavigationServices.navigateTo(AppsRoutes.home);
        break;
      default:
    }
  }

  void dispose() {}
}
