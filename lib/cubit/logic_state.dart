part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}
final class NewsArticleSuccessState extends LogicState {}
final class NewsArticleFailedState extends LogicState {}




final class EmitChangeIndex extends LogicState {}
