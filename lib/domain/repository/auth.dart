import 'package:auth_app/data/models/signin_req_params.dart';
import 'package:auth_app/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams signupReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future logout();
  Future<Either> signin(SigninReqParams signinReq);
}
