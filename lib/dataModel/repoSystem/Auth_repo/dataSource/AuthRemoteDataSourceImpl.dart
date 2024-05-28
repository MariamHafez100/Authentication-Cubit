import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/api.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/AuthRemoteDataSourceContract.dart';
import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<RegisterResponce> register(String name, String email, String phone, String password, String rePassword) async{
    var responce = await apiManager.registerApi(name, email, phone, password, rePassword);
    return responce;
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password)async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorText: l.errorText));
    }, (r){
      return Right(r.toAurjResultEntity());
    });

  }

}