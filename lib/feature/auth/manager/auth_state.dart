part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginErrorState extends AuthState {}
class LoginSuccessState extends AuthState {}

class GetBillsLoadingState extends AuthState {}
class GetBillsErrorState extends AuthState {}
class GetBillsSuccessState extends AuthState {}
class filterBillsState extends AuthState {}
