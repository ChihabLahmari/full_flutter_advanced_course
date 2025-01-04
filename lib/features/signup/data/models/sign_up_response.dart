import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? message;
  @JsonKey(name: 'data')
  SignUpResponseData? signUpResponseData;
  bool? status;
  int? code;

  SignUpResponse({
    required this.message,
    required this.signUpResponseData,
    required this.status,
    required this.code,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class SignUpResponseData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  SignUpResponseData({
    required this.token,
    required this.userName,
  });

  factory SignUpResponseData.fromJson(Map<String, dynamic> json) => _$SignUpResponseDataFromJson(json);
}
