import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) {
    return BlocProvider.of(context);
  }
  // static LogicCubit get(context) => BlocProvider.of(context);

  int x = 0;
  void plusNumber() {
    x++;
    emit(PlusSuccessState());
  }

  void minusNumber() {
    x--;
    emit(PlusSuccessState());
  }

  void resetNumber() {
    x = 0;
    emit(PlusSuccessState());
  }

  bool obscureText = true;
  IconData icon = Icons.visibility_outlined;
  void changeObscureText() {
    obscureText = !obscureText;
    icon = obscureText == true
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;


  
    emit(ChangeObscureTextState());
  }
}
