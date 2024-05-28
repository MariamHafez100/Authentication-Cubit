import 'package:ecommerce/dataModel/repoSystem/Auth_repo/repositroy/AuthRepoImpl.dart';
import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/authRepoContract.dart';

class RegisterUseCase{
  AuthReposatioryContract authReposatioryContract;
  RegisterUseCase({required this.authReposatioryContract});

  Future<RegisterResponce>invoke(String name,String email,String phone,String password,String rePassword){
    return authReposatioryContract.register(name, email, phone, password, rePassword);
  }
}
