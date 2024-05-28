import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/repoSystem/Auth_repo/repositroy/AuthRepoImpl.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/authRepoContract.dart';

import '../../dataModel/baseError.dart';

class LoginUseCase{
  //object mn repo 3shan aklm el data w awslha
AuthReposatioryContract authReposatioryContract;
LoginUseCase({required this.authReposatioryContract});

Future<Either<BaseError, AuthResultEntity>> invoke(String email,String password)async{
  var either = await authReposatioryContract.login(email, password);
  return either.fold((l) {
    return left(BaseError(errorText: l.errorText));
  }, (r) {
    return Right(r);
  });
}
}
