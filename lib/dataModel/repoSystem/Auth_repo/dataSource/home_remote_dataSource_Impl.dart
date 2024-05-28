import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/api.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/domain/enities/CategoryEntity.dart';
import 'package:ecommerce/domain/repo/authRepoDomain/dataSourceDomain/home_remote_dataScourceContract.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract{
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<BaseError, CategoryOrBrandsResponceEntity>> getAllCategories()async {
    // 7ktb el api el awl
    var either = await apiManager.getCategories();
   return either.fold((l) {
      return Left(BaseError(errorText: l.errorText));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, CategoryOrBrandsResponceEntity>> getAllBrands() async{
    var either = await apiManager.getBrands();
    return either.fold((l) {
      return Left(BaseError(errorText: l.errorText));
    }, (r){
      return Right(r);
    });
  }

}