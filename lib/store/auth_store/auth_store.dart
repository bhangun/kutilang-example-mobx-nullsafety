import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/modules/administration/services/admin_services.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/auth_jwt_services.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore with Store {

  @observable
  String username = '';
  @observable
  String userMessage = '';
  @observable
  String password = '';
  @observable
  String passwordMessage = '';
  @observable
  String confirmPassword = '';
  @observable
  String confirmPasswordMessage = '';
  @observable
  bool success = false;
  @observable
  bool loggedIn = false;
  @observable
  bool loading = false;
  @observable
  bool rememberMe = false;
  @observable
  String errorMessage = 'error';
  @observable
  bool showError = false;
  
  

  //@action
  bool get canLogin => hasErrorsInLogin; //&& username !='' && password !='';

  bool get canRegister =>
      !hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;
  @computed
  bool get canForgetPassword =>
      !hasErrorInForgotPassword && username.isNotEmpty;

  // error handling:-------------------------------------------------------------------
  @computed
  bool get hasErrorsInLogin => username != '' || password != '';
@computed
  bool get hasErrorsInRegister =>
      username != null || password != null || confirmPassword != null;
@computed
  bool get hasErrorInForgotPassword => username != null;

  // actions:-------------------------------------------------------------------
@action
  void setUserId(String value) {
    username = value;
    _validateUserEmail(value);
  }
@action
  void setPassword(String value) {
    password = value;
    _validatePassword(value);
  }
@action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void _validateUserEmail(String value) {
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    RegExp regExp = new RegExp(p);

    if (value.isEmpty) {
      userMessage = "Email can't be empty";
    } else if (regExp.hasMatch(value)) {

    } //else userMessage = null;
    /* else if (!isEmail(value)) {
      userMessage = 'Please enter a valid email address';
    } */
    /*else {

      showError = true;
      errorMessage = 'Email provided isn\'t valid.Try another email address';
    }*/
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordMessage = "Password can't be empty";
    } /* else if (value.length < 6) {
      password = "Password must be at-least 6 characters long";
    }  */
    else {
     // passwordMessage = null;
    }
  }
 
  /*void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordMessage = "Confirm password can't be empty";
    } else if (value != password) {
      confirmPasswordMessage = "Password doesn't match";
    } else {
      confirmPasswordMessage = null;
    }
    notifyListeners();
  }*/

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future gotoHome() async {
    FLog.info(text: "Redirect to home!");
    if(loggedIn) NavigationServices.navigateTo(AppsRoutes.home);
  }

  void _loggedin(value){
    try{
      if (value){
        FLog.info(text: "Success login!");
        NavigationServices.navigateTo(AppsRoutes.home);
        loggedIn = true;
        loading = false;
        success = true;

      }else if (value.toString().contains("Unauthorized")){
        showError = true;
        errorMessage =  "Username and password doesn't match";
        loading = false;
      } else {
        showError = true;
        errorMessage =  "Something went wrong, please check your network and try again";
        loading = false;
      }

    } catch (e) {
      showError = true;
      errorMessage =  "Something went wrong, please check your network and try again";
      loading = false;
      FLog.info(text:e.toString());
    }
  }

  @action
  login() async{
    loading = true;
    success = false;
    loggedIn = false;
    AuthServices.login(username, password, rememberMe).then((v)=>_loggedin(v));
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }
  
  @action
  Future logout() async {
    loading = true;
    //await AuthServices.logout();
    NavigationServices.navigateTo(AppsRoutes.login);
    loading = false;
  }

  @action
  Future test() async {
    /* await AdminServices.systemHealth();
    await AdminServices.getLoggers();
    await AdminServices.systemMetrics(); */
  }

}
