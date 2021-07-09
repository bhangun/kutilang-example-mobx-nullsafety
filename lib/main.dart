// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'generated/localization.dart';
import 'services/apps_routes.dart';
import 'services/navigation.dart';
import 'store/app_store/app_store.dart';
import 'utils/modules_registry.dart';
import 'utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  // Initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Register all module
  ModulesRegistry();


  // Run main app
  runApp(KutilangApp());
}

class KutilangApp extends StatelessWidget {
  final _appStore = AppStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      key: Key('app'),
      builder: (context) {
        return MaterialApp(
              key: GlobalKey<NavigatorState>(),
              theme: _appStore.theme,
              routes: RoutesService.routes,
              initialRoute: AppsRoutes.splash,
              navigatorKey: NavigationServices.navigatorKey,
              debugShowCheckedModeBanner: false,
              locale: _appStore.locale,
              localeResolutionCallback: (
                Locale? _locale,
                Iterable<Locale> supportedLocales,
              ) {
                return _appStore.locale;
              },
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''),
                const Locale('id', ''),
                const Locale('ar', ''),
              ],
            );
          });
        ;
  }
}
