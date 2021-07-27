import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'material_theme_colors.dart';

class ThemeServices {
  static TextTheme _buildTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6!.copyWith(fontSize: 18.0),
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText2!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        )
        .apply(
          fontFamily: 'ROBOTO',
          displayColor: MatThemeColors.black,
          bodyColor: MatThemeColors.black,
        );
  }

  static ThemeData darkTheme() {
    Color primaryColor = MatThemeColors.lime[900]!;
    Color secondaryColor = MatThemeColors.lime[200]!;
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        primaryVariant: Color(0x1aF5E0C3),
        secondaryVariant: Color(0xaaC9A87C),
        brightness: Brightness.light,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xffEDD5B3),
        onSecondary: Color(0xffC9A87C),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0));
    final ThemeData base = ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MatThemeColors.defaultColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      primaryColorLight: secondaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: Color(0xFF6997DF),
      accentColor: secondaryColor,
      canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF202124),
      backgroundColor: const Color(0xFFB00020),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      primaryColorBrightness: Brightness.light,
      bottomAppBarColor: Color(0xff6D42CE),
      cardColor: Color(0xaaF5E0C3),
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1aF5E0C3),
      hoverColor: Color(0xffDEC29B),
      highlightColor: Color(0xff936F3E),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
      selectedRowColor: Colors.grey,
      unselectedWidgetColor: Colors.grey.shade400,
      disabledColor: Colors.grey.shade200,
      toggleButtonsTheme: ToggleButtonsThemeData(
          //toggle button theme
          ),
      secondaryHeaderColor: Colors.grey,
      dialogBackgroundColor: Colors.white,
      hintColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
          // default values for InputDecorator, TextField, and TextFormField
          ),
      iconTheme: IconThemeData(
          //icon themes that contrast with card and canvas
          ),
      primaryIconTheme: IconThemeData(
          //icon themes that contrast primary color
          ),
      accentIconTheme: IconThemeData(
          //icon themes that contrast accent color
          ),
      sliderTheme: SliderThemeData(
          // slider themes
          ),
      tabBarTheme: TabBarTheme(
          // tab bat theme
          ),
      tooltipTheme: TooltipThemeData(
          // tool tip theme
          ),
      cardTheme: CardTheme(
          // card theme
          ),
      chipTheme: ChipThemeData(
          backgroundColor: Color(0xff936F3E),
          disabledColor: Color(0xaaF5E0C3),
          shape: StadiumBorder(),
          brightness: Brightness.light,
          labelPadding: EdgeInsets.all(8),
          labelStyle: TextStyle(),
          padding: EdgeInsets.all(8),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.white38,
          selectedColor: Colors.white
          // chip theme
          ),
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: true,
      pageTransitionsTheme: PageTransitionsTheme(
          //page transition theme
          ),
      appBarTheme: AppBarTheme(
          //app bar theme
          ),
      bottomAppBarTheme: BottomAppBarTheme(
          // bottom app bar theme
          ),
      snackBarTheme: SnackBarThemeData(
          // snack bar theme
          ),
      dialogTheme: DialogTheme(
          // dialog theme
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          // floating action button theme
          ),
      navigationRailTheme: NavigationRailThemeData(
          // navigation rail theme
          ),
      typography: Typography.material2018(),
      cupertinoOverrideTheme: CupertinoThemeData(
          //cupertino theme
          ),
      bottomSheetTheme: BottomSheetThemeData(
          //bottom sheet theme
          ),
      popupMenuTheme: PopupMenuThemeData(
          //pop menu theme
          ),
      bannerTheme: MaterialBannerThemeData(
          // material banner theme
          ),
      dividerTheme: DividerThemeData(
          //divider, vertical divider theme
          ),
      buttonBarTheme: ButtonBarThemeData(
          // button bar theme
          ),
    );
    return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = MatThemeColors.green[600]!;
    //Color(0xFFB00020);
    Color secondaryColor = MatThemeColors.lime[100]!;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFFF5E0C3,
        <int, Color>{
          50: Color(0x1a5D4524),
          100: Color(0xa15D4524),
          200: Color(0xaa5D4524),
          300: Color(0xaf5D4524),
          400: Color(0x1a483112),
          500: Color(0xa1483112),
          600: Color(0xaa483112),
          700: Color(0xff483112),
          800: Color(0xaf2F1E06),
          900: Color(0xff2F1E06)
        },
      ),
      accentColorBrightness: Brightness.dark,
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: const Color(0xFF1E88E5),
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor: const Color(0xFFB00020),
      primaryColorBrightness: Brightness.light,
      primaryColorLight: Color(0x1aF5E0C3),
      primaryColorDark: Color(0xff936F3E),
      bottomAppBarColor: Color(0xff6D42CE),
      cardColor: Color(0xaaF5E0C3),
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1aF5E0C3),
      hoverColor: Color(0xffDEC29B),
      highlightColor: Color(0xff936F3E),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
      selectedRowColor: Colors.grey,
      unselectedWidgetColor: Colors.grey.shade400,
      disabledColor: Colors.grey.shade200,
      buttonTheme: ButtonThemeData(
          //button themes
          ),
      toggleButtonsTheme: ToggleButtonsThemeData(
          //toggle button theme
          ),
      secondaryHeaderColor: Colors.grey,
      dialogBackgroundColor: Colors.white,
      hintColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
          // default values for InputDecorator, TextField, and TextFormField
          ),
      iconTheme: IconThemeData(
          //icon themes that contrast with card and canvas
          ),
      primaryIconTheme: IconThemeData(
          //icon themes that contrast primary color
          ),
      accentIconTheme: IconThemeData(
          //icon themes that contrast accent color
          ),
      sliderTheme: SliderThemeData(
          // slider themes
          ),
      tabBarTheme: TabBarTheme(
          // tab bat theme
          ),
      tooltipTheme: TooltipThemeData(
          // tool tip theme
          ),
      cardTheme: CardTheme(
          // card theme
          ),
      chipTheme: ChipThemeData(
          backgroundColor: Color(0xff936F3E),
          disabledColor: Color(0xaaF5E0C3),
          shape: StadiumBorder(),
          brightness: Brightness.light,
          labelPadding: EdgeInsets.all(8),
          labelStyle: TextStyle(),
          padding: EdgeInsets.all(8),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.white38,
          selectedColor: Colors.white),
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: true,
      pageTransitionsTheme: PageTransitionsTheme(
          //page transition theme
          ),
      appBarTheme: AppBarTheme(
          //app bar theme
          ),
      bottomAppBarTheme: BottomAppBarTheme(
          // bottom app bar theme
          ),
      snackBarTheme: SnackBarThemeData(
          // snack bar theme
          ),
      dialogTheme: DialogTheme(
          // dialog theme
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          // floating action button theme
          ),
      navigationRailTheme: NavigationRailThemeData(
          // navigation rail theme
          ),
      typography: Typography.material2018(),
      cupertinoOverrideTheme: CupertinoThemeData(
          //cupertino theme
          ),
      bottomSheetTheme: BottomSheetThemeData(
          //bottom sheet theme
          ),
      popupMenuTheme: PopupMenuThemeData(
          //pop menu theme
          ),
      bannerTheme: MaterialBannerThemeData(
          // material banner theme
          ),
      dividerTheme: DividerThemeData(
          //divider, vertical divider theme
          ),
      buttonBarTheme: ButtonBarThemeData(
          // button bar theme
          ),
    );
    return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }
}
