import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/domain/enities/CategoryEntity.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/home_remote_dataScourceContract.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/homeReposatoryContract.dart';

class HomeReposatoryImpl implements HomeReposatoryContract{
  HomeRemoteDataSourceContract remoteDataSourceContract;
  HomeReposatoryImpl({required this.remoteDataSourceContract});
  @override
  Future<Either<BaseError, CategoryOrBrandsResponceEntity>> getAllCategories() {
    return remoteDataSourceContract.getAllCategories();
  }

  @override
  Future<Either<BaseError, CategoryOrBrandsResponceEntity>> getAllBrands() {
    return remoteDataSourceContract.getAllBrands();
  }


}