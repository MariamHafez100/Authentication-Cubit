import 'package:ecommerce/domain/enities/UserEntity.dart';

class AuthResultEntity{
  // dh ll login w register dh el result 3momn dh kda el domain 7y3tmd 3lih mlosh 3laka b resoponce b2a dh pure class result

  UserEntity? userEntity;
  String? token;
  AuthResultEntity({ this.userEntity, this.token});
}