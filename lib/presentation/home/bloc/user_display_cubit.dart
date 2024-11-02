import 'package:auth_app/domain/usecases/get_user.dart';
import 'package:auth_app/presentation/home/bloc/user_display_state.dart';
import 'package:auth_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserLoadingState());

  void displayUser() async {
    var result = await sl<GetUserUseCase>().call();
    result.fold(
      (error) => emit(UserErrorState(errorMessage: error.toString())),
      (data) => emit(UserLoadedState(data)),
    );
  }
}
