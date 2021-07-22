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

import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/localization.dart';
import 'services/apps_routes.dart';
import 'services/navigation.dart';
import 'store/app_store/app_store.dart';
import 'store/app_store/preferences_service.dart';
import 'store/app_store/settings_store.dart';
import 'utils/modules_registry.dart';
import 'utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/themes/theme_services.dart';

Future<void> main() async {
  // Initialized
  WidgetsFlutterBinding.ensureInitialized();
final sharedPreferences = await SharedPreferences.getInstance();
  //initializeReflectable();
  // Register all module
  ModulesRegistry();

  mainContext.spy(print);
  // Run main app
  runApp(KutilangApp(sharedPreferences));
}

class KutilangApp extends StatelessWidget {
  const KutilangApp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            Provider<AppStore>(
              create: (_) => AppStore(),
              dispose: (_, store) => store.dispose(),
            ),
             Provider<PreferencesService>(
              create: (_) => PreferencesService(sharedPreferences),
            ),
            ProxyProvider<PreferencesService, SettingsStore>(
                update: (_, preferencesService, __) =>
                    SettingsStore(preferencesService)),
          ],
          child: Consumer<SettingsStore>(
              builder: (_, store, __) => Observer(
                  key: Key('kutilangapp'),
                  builder: (_) => MaterialApp(
                        key: GlobalKey<NavigatorState>(),
                        theme: ThemeData(
                          primarySwatch: Colors.blue,
                          brightness: store.isLightTheme
                              ? Brightness.light
                              : Brightness.dark,
                        ),

                        /* store.isLightTheme
                          ? ThemeServices.lightTheme()
                          : ThemeServices.darkTheme(), */
                        routes: RoutesService.routes,
                        initialRoute: AppsRoutes.splash,
                        navigatorKey: NavigationServices.navigatorKey,
                        debugShowCheckedModeBanner: false,
                        locale: store.locale,
                        localeResolutionCallback: (
                          Locale? _locale,
                          Iterable<Locale> supportedLocales,
                        ) {
                          FLog.info(
                              text: '<><><><><>' + store.locale.toString());
                          return store.locale;
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
                      ))));
}
