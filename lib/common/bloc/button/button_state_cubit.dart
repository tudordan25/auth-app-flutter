import 'package:auth_app/common/bloc/button/button_state.dart';
import 'package:auth_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      Either result = await usecase.call(params: params);
      result.fold(
        (left) => emit(ButtonFailureState(errorMessage: left.toString())),
        (right) => emit(ButtonSuccessState()),
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
