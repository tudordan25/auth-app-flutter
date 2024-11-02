import 'package:auth_app/core/usecase/usecase.dart';
import 'package:auth_app/domain/repository/auth.dart';
import 'package:auth_app/service_locator.dart';

class LogoutUseCase implements UseCase<dynamic, dynamic> {
  @override
  Future call({dynamic params}) async {
    return sl<AuthRepository>().logout();
  }
}
