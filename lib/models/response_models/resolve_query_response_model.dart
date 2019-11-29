class ResolveQueryResponseModel {
  String response;
  String responseCode;

  static ResolveQueryResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResolveQueryResponseModel resolveQueryResponseModelBean = ResolveQueryResponseModel();
    resolveQueryResponseModelBean.response = map['response'];
    resolveQueryResponseModelBean.responseCode = map['response_code'];
    return resolveQueryResponseModelBean;
  }

  Map toJson() => {
    "response": response,
    "response_code": responseCode,
  };
}