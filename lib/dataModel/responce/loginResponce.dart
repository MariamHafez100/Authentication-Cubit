import 'package:ecommerce/dataModel/responce/User.dart';
import 'package:ecommerce/domain/enities/AuthResultEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2NlOWY0MzgwNGJjNjRkZTJkNzVlMSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4ODc4MDI2LCJleHAiOjE3MDY2NTQwMjZ9.a46e-EHl4mF24gBrF6_1tZpc0dhcQrmOu6pMVgGPFyU"

class LoginResponce {
  LoginResponce({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponce.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];

  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
AuthResultEntity toAurjResultEntity(){
    return AuthResultEntity(
      userEntity: user?.toUserEntity(),
      token: token,
    );
}
}

