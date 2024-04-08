import 'package:dartz/dartz.dart';
import 'package:quiz/core/constants/error_messages.dart';
import 'package:quiz/core/exceptions/network_exception.dart';
import 'package:quiz/core/exceptions/server_exception.dart';
import 'package:quiz/core/network_service/network_service.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/field/register_faild_response_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/success/login_response_model.dart';
import 'package:quiz/feature/auth/data_source/remote/auth_data_source.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  AuthDataSource authDataSource;
  @override
  NetworkService networkService;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkService,
  });

  @override
  Future<Either<RegisterFaildRequestModel, LoginResponseModel>> customerLogin(
      {required LoginRequestModel loginRequestModel}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
          await authDataSource.customerLogin(loginRequestModel: loginRequestModel);
      return Right(result);
    } on ErrorExceptionForRegister catch (e) {
      return Left (RegisterFaildRequestModel(
        data: e.data,
        status: e.status,
        message: e.message,
        code: e.code,
      ));
    } on NetworkException catch (e) {
      return Left(RegisterFaildRequestModel(
        message: Network_Connection_Ar_Error,
      ));
    }
  }

  @override
  Future<Either<RegisterFaildRequestModel, dynamic>> getBills() async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result =
      await authDataSource.getBills();
      return Right(result);
    } on ErrorExceptionForRegister catch (e) {
      return Left (RegisterFaildRequestModel(
        data: e.data,
        status: e.status,
        message: e.message,
        code: e.code,
      ));
    } on NetworkException catch (e) {
      return Left(RegisterFaildRequestModel(
        message: Network_Connection_Ar_Error,
      ));
    }
  }

}
