class LoginResponseModel {
  String responseMessage;
  String responseCode;
  String institute;
  String username;
  String instituteName;
  String email;
  String role;
  String instituteId;
  String role1;
  String password;

  static LoginResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginResponseModel loginResponseModelBean = LoginResponseModel();
    loginResponseModelBean.responseMessage = map['responseMessage'];
    loginResponseModelBean.responseCode = map['responseCode'];
    loginResponseModelBean.institute = map['institute'];
    loginResponseModelBean.username = map['username'];
    loginResponseModelBean.instituteName = map['institute_name'];
    loginResponseModelBean.email = map['email'];
    loginResponseModelBean.role = map['role'];
    loginResponseModelBean.instituteId = map['institute_id'];
    loginResponseModelBean.role1 = map['role1'];
    loginResponseModelBean.password = map['password'];
    return loginResponseModelBean;
  }

  Map toJson() => {
    "responseMessage": responseMessage,
    "responseCode": responseCode,
    "institute": institute,
    "username": username,
    "institute_name": instituteName,
    "email": email,
    "role": role,
    "institute_id": instituteId,
    "role1": role1,
    "password": password,
  };

  @override
  String toString() {
    return 'LoginResponseModel{responseMessage: $responseMessage, responseCode: $responseCode, institute: $institute, username: $username, instituteName: $instituteName, email: $email, role: $role, instituteId: $instituteId, role1: $role1, password: $password}';
  }


}
