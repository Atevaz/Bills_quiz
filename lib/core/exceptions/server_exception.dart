import 'package:quiz/feature/auth/data_source/models/response/field/register_faild_response_model.dart';

class ServerException implements Exception {
  final String arMessage;
  final String enMessage;

  const ServerException({
    required this.enMessage,
    required this.arMessage,
  });
}
class ErrorExceptionForRegister implements Exception {
  int? status;
  int? code;
  String? message;
  RegisterFaildRequestModelData? data;

  ErrorExceptionForRegister({
    this.status,
    this.code,
    this.message,
    this.data,
  });
  ErrorExceptionForRegister.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code']?.toInt();
    message = json['message']?.toString();
    data = (json['data'] != null) ? RegisterFaildRequestModelData.fromJson(json['data']) : null;
  }
}