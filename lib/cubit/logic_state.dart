part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}

final class NewsArticleSuccessState extends LogicState {}

final class NewsArticleFailedState extends LogicState {}

final class EmitChangeIndex extends LogicState {}




final class LoginLoadingState extends LogicState {}

final class LoginSuccessState extends LogicState {}

final class LoginFailedState extends LogicState {}
final class ChangeSuffixIconState extends LogicState {}
final class GoogleSignInSuccessState extends LogicState {}
final class GoogleSignInFailedState extends LogicState {}
