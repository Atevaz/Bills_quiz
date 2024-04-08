
import 'package:quiz/core/dio_service/dio_service.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/success/login_response_model.dart';

abstract class AuthDataSource {
  late DioService dioService;
  Future<LoginResponseModel> customerLogin({required LoginRequestModel loginRequestModel});
  Future<dynamic> getBills();
}
