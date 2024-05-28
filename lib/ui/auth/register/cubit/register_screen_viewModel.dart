import 'package:ecommerce/dataModel/api.dart';
import 'package:ecommerce/ui/auth/register/cubit/RegisterStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repo/authRepoDomain/reposatoryDomain/authRepoContract.dart';
import '../../../../domain/usecase/RegisterUsecase.dart';
//dh el bloc
class RegisterScreenViewModel extends Cubit<RegisterStates>{
  //AuthReposatioryContract authReposatoryContract; 78yrha ll use case b2a
  RegisterUseCase registerUseCase;
  //injection
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  void register()async{
    if (formKey.currentState?.validate() == true){
      emit(RegisterLoadingState(loadingText: "LOADING..."));

      try{
        var response = await registerUseCase.invoke(nameController.text, emailController.text,
            phoneController.text, passwordController.text, confirmationPasswordController.text);
        if(response.message != "success"){
          emit(RegisterErrorState(errorText: response.message!));
        }else {
          emit(RegisterSuccState(registerResponce: response));
        }
      } catch (e){
        emit(RegisterErrorState(errorText: e.toString()));
      }
    }

  }
}