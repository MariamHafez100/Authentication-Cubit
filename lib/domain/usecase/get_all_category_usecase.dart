import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/reposatoryDomain/homeReposatoryContract.dart';

import '../../dataModel/baseError.dart';
import '../enities/CategoryEntity.dart';

class getAllCategoryUseCase{
  HomeReposatoryContract homeReposatoryContract;
  getAllCategoryUseCase({required this.homeReposatoryContract});

  Future<Either<BaseError, CategoryOrBrandsResponceEntity>> invoke(){
    return homeReposatoryContract.getAllCategories();


  }
}