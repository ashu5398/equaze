class LoginRequestModel {
  String username;
  String password;
  String institute;


  static LoginRequestModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginRequestModel loginRequestModelBean = LoginRequestModel();
    loginRequestModelBean.username = map['username'];
    loginRequestModelBean.password = map['password'];
    loginRequestModelBean.institute = map['institute'];
    return loginRequestModelBean;
  }

  Map toJson(String username,String password,String institute) => {
    "username": username,
    "password": password,
    "institute": institute,
  };
}