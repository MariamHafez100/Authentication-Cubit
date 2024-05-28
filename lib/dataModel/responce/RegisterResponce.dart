import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2NlOWY0MzgwNGJjNjRkZTJkNzVlMSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NDkwODY5LCJleHAiOjE3MDYyNjY4Njl9._WjLLzlIwoMcfCT48VvQqWfUCde08RiyddG5yOEtfp8"

class RegisterResponce {
  RegisterResponce({
      this.message, 
      this.user, 
      this.token,
    this.error
  });

  RegisterResponce.fromJson(dynamic json) {
    message = json['message'];
    error = json['errors'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}