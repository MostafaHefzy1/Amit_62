part of 'logic_cubit.dart';

@immutable
sealed class LogicState {}

final class LogicInitial extends LogicState {}

final class PlusSuccessState extends LogicState {}
final class ChangeObscureTextState extends LogicState {}

