import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';

abstract class AuthReposatioryContract{
  Future<RegisterResponce> register(String name,String email,String phone,String password,String rePassword);

  Future<Either<BaseError,AuthResultEntity>>login(String email,String password);
}