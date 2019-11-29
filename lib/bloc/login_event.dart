import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {

  const LoginEvent();

}

class GetLoginResponseModel extends LoginEvent
{

  final String instituteId;
  final String email;
  final String password;

  GetLoginResponseModel(this.instituteId,this.email,this.password);

  @override
  List<Object> get props => [instituteId,email,password];

}
