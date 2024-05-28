import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/AuthRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/authRepoContract.dart';
import 'package:ecommerce/dataModel/repoSystem/Auth_repo/dataSource/AuthRemoteDataSourceImpl.dart';
import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';

class AuthReposatoryImpl implements AuthReposatioryContract{
  AuthRemoteDataSource authRemoteDataSource;
  AuthReposatoryImpl({required this.authRemoteDataSource});
  @override
  Future<RegisterResponce> register(String name, String email, String phone, String password, String rePassword) {
    return authRemoteDataSource.register(name, email, phone, password, rePassword);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }

}
