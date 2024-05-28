import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/dataModel/baseError.dart';
import 'package:ecommerce/dataModel/request/RigesterRequest.dart';
import 'package:ecommerce/dataModel/request/loginRequest.dart';
import 'package:ecommerce/dataModel/responce/CategoryResponceDto.dart';
import 'package:ecommerce/dataModel/responce/RegisterResponce.dart';
import 'package:ecommerce/dataModel/responce/loginResponce.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';


class ApiManager{
  //de ll private
  ApiManager._();
  //singleton
  static ApiManager? _instance;
  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance!;
  }
   Future<RegisterResponce> registerApi(String name,String email,String phone,String password,String rePassword,)async{

     // final connectivityResult = await (Connectivity().checkConnectivity());
     // if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
     //
     // }
    //https://ecommerce.routemisr.com/api/v1/auth/signup
    Uri url = Uri.https("ecommerce.routemisr.com","api/v1/auth/signup");
    var request = RigesterRequest(
      name: name,
      email: email,
      password:password ,
      rePassword: rePassword,
      phone: phone
    );
     var responseOfRequest = await http.post(url,body: request.toJson());
     return RegisterResponce.fromJson(jsonDecode(responseOfRequest.body));

  }
  Future<Either<BaseError,LoginResponce>> login(String email,String password)async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https("ecommerce.routemisr.com","api/v1/auth/signin");
      var request = LoginRequest(
          email: email,
          password:password ,
      );
      var responce = await http.post(url,body: request.toJson());
       var loginResponce = LoginResponce.fromJson(jsonDecode(responce.body));
       if(responce.statusCode >=200 && responce.statusCode <300){
         return Right(loginResponce);
       }else{
         return Left(BaseError(errorText: loginResponce.message));
       }

    }else{
      return Left(BaseError(errorText: "CHECK YOUR INTERNET CONNECTIONS"));
    }
  }
  Future<Either<BaseError,CategoryOrBrandsResponceDto>> getCategories()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https("ecommerce.routemisr.com","api/v1/categories");

      var responce = await http.get(url);
      var CategoryResponce = CategoryOrBrandsResponceDto.fromJson(jsonDecode(responce.body));
      if(responce.statusCode >=200 && responce.statusCode <300){
        return Right(CategoryResponce);
      }else{
        return Left(BaseError(errorText: CategoryResponce.message));
      }

    }else{
      return Left(BaseError(errorText: "CHECK YOUR INTERNET CONNECTIONS"));
    }
  }
  Future<Either<BaseError,CategoryOrBrandsResponceDto>> getBrands()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https("ecommerce.routemisr.com","api/v1/brands");

      var responce = await http.get(url);
      var BrandsResponce = CategoryOrBrandsResponceDto.fromJson(jsonDecode(responce.body));
      if(responce.statusCode >=200 && responce.statusCode <300){
        return Right(BrandsResponce);
      }else{
        return Left(BaseError(errorText: BrandsResponce.message));
      }

    }else{
      return Left(BaseError(errorText: "CHECK YOUR INTERNET CONNECTIONS"));
    }
  }


}