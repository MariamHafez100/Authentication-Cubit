import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/domain/enities/CategoryEntity.dart';

abstract class HomeReposatoryContract{
  Future<Either<BaseError,CategoryOrBrandsResponceEntity>> getAllCategories();
  Future<Either<BaseError,CategoryOrBrandsResponceEntity>> getAllBrands();

}