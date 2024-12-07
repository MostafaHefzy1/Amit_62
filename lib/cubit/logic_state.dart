part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}

final class LoginLoadingState extends LogicState {}

final class LoginSuccessState extends LogicState {}

final class LoginFailedState extends LogicState {}

final class RegisterLoadingState extends LogicState {}

final class RegisterSuccessState extends LogicState {}

final class RegisterFailedState extends LogicState {}





final class ForgetPasswordLoadingState extends LogicState {}

final class ForgetPasswordSuccessState extends LogicState {}

final class ForgetPasswordFailedState extends LogicState {}



final class UpdateLoadingState extends LogicState {}

final class UpdateSuccessState extends LogicState {}

final class UpdateFailedState extends LogicState {}



final class SetUserSuccessState extends LogicState {}
final class SetUserFailedState extends LogicState {}


final class GetUserSuccessState extends LogicState {}
final class GetUserFailedState extends LogicState {}



final class GetMessagesSuccessState extends LogicState {}


final class ChangeCurrentIndex extends LogicState {}



final class GetAllUserSuccessState extends LogicState {}
final class GetAllUserFailedState extends LogicState {}




final class StoreMessageSuccessState extends LogicState {}
final class StoreMessageFailedState extends LogicState {}
