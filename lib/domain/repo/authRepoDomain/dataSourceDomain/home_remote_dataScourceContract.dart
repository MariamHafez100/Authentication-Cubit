import 'package:dartz/dartz.dart';

import '../../../../dataModel/baseError.dart';
import '../../../enities/CategoryEntity.dart';

abstract class HomeRemoteDataSourceContract{
  Future<Either<BaseError,CategoryOrBrandsResponceEntity>> getAllCategories();
  Future<Either<BaseError,CategoryOrBrandsResponceEntity>> getAllBrands();


}