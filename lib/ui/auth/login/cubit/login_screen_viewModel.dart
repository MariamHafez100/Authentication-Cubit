
import 'package:ecommerce/ui/auth/login/cubit/loginStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/login_UseCase.dart';
import '../../../Home/homeScreen.dart';

class loginScreenViewModel extends Cubit<loginStates>{
  LoginUseCase loginUseCase;
  loginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  Login()async{
    if(formKey.currentState!.validate()== true){
      emit(LoginloadingState(loadingText: "LOADING..."));
      var either = await loginUseCase.invoke(emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorText: l.errorText));
      }, (r) {
        emit(LoginSuccState(responce: r));
        //Navigator.pushReplacementNamed(context,HomeScreen.routeName );

      });
    }
  }

}