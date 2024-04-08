import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/constants/shared_preferences_consts.dart';
import 'package:quiz/core/di/injection_container.dart';
import 'package:quiz/core/shared_preferences/preference_helper.dart';
import 'package:quiz/core/widgets/toast.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/data_source/models/response/success/login_response_model.dart';
import 'package:quiz/feature/auth/data_source/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  PreferenceHelper preferenceHelper =
      PreferenceHelper(preferencesProvider: serviceLocator());

  LoginResponseModel? loginResponseModel;

  Map mahmoud = {};

  List<dynamic>? bills = [];

  Future customerLogin({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoadingState());
    final result = await authRepository.customerLogin(
        loginRequestModel: loginRequestModel);
    result.fold(
      (l) {
        emit(LoginErrorState());
        if (l.data != null) {
          if (l.data!.phone != null) {
            showToast(
              text: l.data!.phone![0].toString(),
              state: ToastStates.ERROR,
            );
          }
        } else if (l.message != null) {
          showToast(
            text: l.message.toString(),
            state: ToastStates.ERROR,
          );
        }
      },
      (r) {
        loginResponseModel = r;
        preferenceHelper.saveDataSharedPreference(
            key: 'branch', value: loginResponseModel!.bRANCH);
        branch = loginResponseModel!.bRANCH ;
        preferenceHelper.saveDataSharedPreference(
            key: 'personalNumber', value: loginResponseModel!.pERSONNELNUMBER);
        personalNumber = loginResponseModel!.pERSONNELNUMBER ;
        emit(LoginSuccessState());
      },
    );
  }

  Future getBills() async {
    emit(GetBillsLoadingState());
    final result = await authRepository.getBills();
    result.fold(
      (l) {
        emit(GetBillsErrorState());
        if (l.message != null) {
          showToast(
            text: l.message.toString(),
            state: ToastStates.ERROR,
          );
        }
      },
      (r) {
        mahmoud = r;
        mahmoud.forEach((key, value) {
          bills!.add(value);
          print(bills.toString());
        });
        emit(GetBillsSuccessState());
      },
    );
  }

  List <dynamic> filteredBillsList = [];

  void filterBills ({required String q}){
    filteredBillsList = []  ;
    filteredBillsList = bills!.sublist(1).where((element) => element['SalesId'].toLowerCase().startsWith(q) || element['SalesId'].toLowerCase().contains(q)).toList() ;
    print(filteredBillsList.toString());
    emit(filterBillsState());
  }
}
