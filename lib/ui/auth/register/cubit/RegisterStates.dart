import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';

abstract class RegisterStates{}
 class RegisterInitialState extends RegisterStates{}
 class RegisterLoadingState extends RegisterStates{
  String? loadingText;
  RegisterLoadingState({required this.loadingText});
}
 class RegisterErrorState extends RegisterStates{
  String? errorText;
  RegisterErrorState({required this.errorText});
}
class RegisterSuccState extends RegisterStates{
  //responce
 RegisterResponce? registerResponce;
 RegisterSuccState({required this.registerResponce});
}
