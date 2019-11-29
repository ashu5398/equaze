import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equaze/repository/repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is GetLoginResponseModel) {
      yield LoggingInState();
      final response = await Repository.loginUser(event.instituteId, event.email, event.password);
      yield response != null && response.responseCode == "00" ? LoginSuccessState(response) : LoginFailedState(response);
    }
  }
}
