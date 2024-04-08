import 'package:dartz/dartz.dart';
import 'package:quiz/core/network_service/network_service.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/field/register_faild_response_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/success/login_response_model.dart';

import '../remote/auth_data_source.dart';

abstract class AuthRepository {
  late NetworkService networkService;
  late AuthDataSource authDataSource;

  Future<Either<RegisterFaildRequestModel, LoginResponseModel>> customerLogin(
      {required LoginRequestModel loginRequestModel});

  Future<Either<RegisterFaildRequestModel, dynamic>> getBills();

}
