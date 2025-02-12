import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  LoginResponseData? loginResponseData;
  bool? status;
  int? code;

  LoginResponse({
    required this.message,
    required this.loginResponseData,
    required this.status,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginResponseData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  LoginResponseData({
    required this.token,
    required this.userName,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);
}
