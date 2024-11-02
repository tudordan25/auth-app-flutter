import 'package:auth_app/domain/entities/user.dart';

abstract class UserDisplayState {}

class UserLoadingState extends UserDisplayState {}

class UserLoadedState extends UserDisplayState {
  final UserEntity userEntity;

  UserLoadedState(this.userEntity);
}

class UserErrorState extends UserDisplayState {
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}
