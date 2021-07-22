import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutilang_example/generated/localization.dart';
import 'package:kutilang_example/layout/mobile.dart';

import 'package:kutilang_example/modules/kojek/ko_routes.dart';
//import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:kutilang_example/store/app_store/app_store.dart';

import '../utils/config.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _Loginpagestate createState() => _Loginpagestate();
}

class _Loginpagestate extends State<LoginScreen> {
  // text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  late FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  bool _isEyeOpen = true;

  bool _isObscure = true;
  final _appStore = AppStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      // this will be called whenever user types in some value
      // context.read<AuthBloc>().setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      // context.read<AuthBloc>().setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
            primary: true,
            appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                actions: [
                  IconButton(
                    splashRadius: 15,
                    color: Theme.of(context).buttonColor,
                    icon: Icon(Icons.pedal_bike),
                    onPressed: () =>
                        NavigationServices.navigateTo(KoRoutes.koHome),
                  ),
                  IconButton(
                      splashRadius: 15,
                      color: Theme.of(context).buttonColor,
                      icon: Icon(Icons.brightness_6),
                      onPressed: () => _appStore.switchTheme() //.toggleTheme(),
                      ),
                  IconButton(
                      splashRadius: 15,
                      color: Theme.of(context).buttonColor,
                      icon: Icon(Icons.flag),
                      onPressed: () => _showLocales()),
                ]),
            body: _body(context)));
  }

  _body(BuildContext context) {
    return Observer(
        key: Key('login_page'),
        builder: (context) {
          return Material(
              key: _formKey,
              child: MobileLayout(
                rightChild: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      IMAGE_SPLASH,
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(height: 24.0),
                    _userIdField(),
                    _passwordField(),
                    _forgotPasswordButton(),
                    _signInButton(),
                  ],
                ),
                leftChild: SizedBox.expand(
                    child: SvgPicture.asset(
                  IMAGE_SPLASH,
                  width: 100,
                  height: 100,
                )),
                showProgress: false,
              ));
        });
  }

  Widget _userIdField() => Observer(
      key: Key('user_field'),
      builder: (context) {
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _appStore.userMessage,
        );
      });

  Widget _passwordField() => Observer(
      key: Key('password_field'),
      builder: (context) {
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.password,
          isObscure: _isObscure,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _appStore.passwordMessage,
          onEyePressed: () => _onEyePressed(),
          isEyeOpen: _isEyeOpen,
          showEye: true,
        );
      });

  Widget _forgotPasswordButton() => Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
          key: Key('user_forgot_password'),
          child: Text(AppLocalizations.of(context)!.forgotPassword!),
          onPressed: () => _appStore.forgotPassword()));

  Widget _signInButton() => Observer(
      key: Key('signin_btn'),
      builder: (context) {
        return ElevatedButton(
          key: Key('user_sign_button'),
          onPressed: () => _appStore.login(),
          child: Text(AppLocalizations.of(context)!.sign_in!),
        );
      });

  _onEyePressed() {
    setState(() {
      _isEyeOpen = _isEyeOpen ? false : true;
      _isObscure = _isEyeOpen ? true : false;
    });
  }

  _showLocales() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: ListView(
                children: [
                  _localeBtn('Bahasa', 'ID'),
                  _localeBtn('English', 'EN'),
                ],
              ));
        });
  }

  _localeBtn(title, key) {
    return TextButton(
        child: Text(title + _appStore.locale.toString()),
        onPressed: () => _onLocalePressed(key));
  }

  _onLocalePressed(key) {
    _appStore.switchLocale(key);
  }

  _showModal(text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text(text),
      duration: Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}