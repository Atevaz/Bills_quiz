import 'package:quiz/core/constants/end_points.dart';
import 'package:quiz/core/constants/shared_preferences_consts.dart';
import 'package:quiz/core/dio_service/dio_service.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/success/login_response_model.dart';
import 'package:quiz/feature/auth/data_source/remote/call_api.dart';

import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  DioService dioService;

  AuthDataSourceImpl({required this.dioService});

  @override
  Future<LoginResponseModel> customerLogin(
      {required LoginRequestModel loginRequestModel}) async {
    final result = await callApi(
      call: () async => await dioService.post(
          endPoint: customerLoginEndPoint, data: loginRequestModel.toJson()),
    );
    final response = LoginResponseModel.fromJson(result);
    return response;
  }

  @override
  Future<dynamic> getBills() async {
    final result = await callApi(
      call: () async => await dioService.post(
          endPoint: getBillsEndPoint,
          data: {'BRANCH': branch, 'PERSONNELNUMBER': personalNumber}),
    );
    final response = result;
    return response;
  }
}
