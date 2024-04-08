import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz/core/constants/error_messages.dart';
import 'package:quiz/core/exceptions/server_exception.dart';
import 'package:quiz/feature/auth/data_source/models/response/field/register_faild_response_model.dart';

Future callApi({
  required Future<Response> Function() call,
}) async {
  try {
    final r = await call.call();
    debugPrint("Response_Data => ${r.data}");
    debugPrint("Response_Code => ${r.statusCode}");

    if (r.data['status'] != 200) {
      throw ErrorExceptionForRegister.fromJson(r.data);
    }

    return r.data;
  } on DioError catch (e) {
    debugPrint("Error_Message => ${e.message}");
    debugPrint("Error_Error => ${e.error.toString()}");
    debugPrint("Error_Type => ${e.type.toString()}");

    throw ErrorExceptionForRegister(
      code: 401,
      message: 'Error',
      status: 401,
    );
  } on ErrorExceptionForRegister catch (e) {
    ErrorExceptionForRegister exception = e;
    throw ErrorExceptionForRegister(
      data: exception.data,
      code: exception.code,
      message: exception.message,
      status: exception.status,
    );
  } catch (e) {
    throw ErrorExceptionForRegister(
      code: 401,
      message: 'Error',
      status: 401,
    );
  }
}
