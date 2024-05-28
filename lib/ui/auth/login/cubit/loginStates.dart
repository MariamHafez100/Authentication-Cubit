import 'package:ecommerce/domain/enities/AuthResultEntity.dart';

abstract class loginStates{}
class LoginloadingState extends loginStates{
  String? loadingText;
  LoginloadingState({this.loadingText});
}
class LoginInitialState extends loginStates{}
class LoginSuccState extends loginStates{
  // responce
  AuthResultEntity responce;
  LoginSuccState({required this.responce});
}
class LoginErrorState extends loginStates{
  String? errorText;
  LoginErrorState({this.errorText});
}
