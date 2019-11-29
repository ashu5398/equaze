import 'package:equatable/equatable.dart';
import 'package:equaze/models/response_models/login_response_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggingInState extends LoginState
{
  @override
  List<Object> get props => null;
}

class LoginFailedState extends LoginState
{
  final LoginResponseModel loginResponseModel;

  LoginFailedState(this.loginResponseModel);

  @override
  List<Object> get props => [loginResponseModel];
}

class LoginSuccessState extends LoginState
{
  final LoginResponseModel loginResponseModel;

  LoginSuccessState(this.loginResponseModel);

  @override
  List<Object> get props => [loginResponseModel];

}
