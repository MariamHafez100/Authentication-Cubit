import 'package:ecommerce/dataModel/repoSystem/Auth_repo/dataSource/home_remote_dataSource_Impl.dart';
import 'package:ecommerce/dataModel/repoSystem/Auth_repo/repositroy/homeRepoImpl.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/AuthRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/home_remote_dataScourceContract.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/authRepoContract.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/homeReposatoryContract.dart';
import 'package:ecommerce/domain/usecase/RegisterUsecase.dart';
import 'package:ecommerce/domain/usecase/get_all_Brands_UseCase.dart';
import 'package:ecommerce/domain/usecase/get_all_category_usecase.dart';
import 'package:ecommerce/domain/usecase/login_UseCase.dart';

import '../dataModel/api.dart';
import '../dataModel/repoSystem/Auth_repo/dataSource/AuthRemoteDataSourceImpl.dart';
import '../dataModel/repoSystem/Auth_repo/repositroy/AuthRepoImpl.dart';

AuthRemoteDataSource injectDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
AuthReposatioryContract injectReposatory(){
  return AuthReposatoryImpl(authRemoteDataSource: injectDataSource());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authReposatioryContract: injectReposatory());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authReposatioryContract: injectReposatory());
}
getAllCategoryUseCase injectGetAllCatgoryUseCase(){
  return getAllCategoryUseCase(homeReposatoryContract:injectHomeReposatoryContract() );
}
getAllBrandsUseCase injectBrandsUseCase(){
  return getAllBrandsUseCase(homeReposatoryContract: injectHomeReposatoryContract());
}
HomeReposatoryContract injectHomeReposatoryContract(){
  return HomeReposatoryImpl(remoteDataSourceContract:injectHomeDataSource() );
}
HomeRemoteDataSourceContract injectHomeDataSource(){
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}