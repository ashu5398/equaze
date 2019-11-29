import 'dart:convert';

import 'package:equaze/Constants.dart';
import 'package:equaze/models/request_models/get_grievance_list_request_model.dart';
import 'package:equaze/models/request_models/login_request_model.dart';
import 'package:equaze/models/request_models/resolve_query_request_model.dart';
import 'package:equaze/models/response_models/dashboard_counters_response_model.dart';
import 'package:equaze/models/response_models/dashboard_response_model.dart';
import 'package:equaze/models/response_models/grievance_list_response_model.dart';
import 'package:equaze/models/response_models/institute_list_model.dart';
import 'package:equaze/models/response_models/login_response_model.dart';
import 'package:equaze/models/response_models/resolve_query_response_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  //Get Institute API
  static Future<List<InstituteListModel>> getInstituteList() async {
    final response = await http.get(Constant.GET_INSTITUTE_URL);
    return InstituteList.fromJson(response.body);
  }

  static Future<LoginResponseModel> loginUser(String instituteId, String username, String password) async {
    final response = await http.post(Constant.LOGIN_URL, body: json.encode(LoginRequestModel().toJson(username, password, instituteId)));
    return LoginResponseModel.fromMap(json.decode(response.body));
  }

  static Future<DashboardResponseModel> getDashboardData(String instituteId) async{
    final response = await http.get(Constant.DASHBOARD_URL+"?json={institute_id:$instituteId,is_pie_chart:1}");
    return DashboardResponseModel.fromMap(json.decode(response.body));
  }

  static Future<List<GrievanceListResponseModel>> getGrievanceList(GetGrievanceListRequestModel getGrievanceListRequestModel) async
  {
    final response = await http.post(Constant.GET_GRIEVANCE_LIST,body:json.encode(getGrievanceListRequestModel));
    return GrievanceList.fromJson(response.body);
  }
  
  static Future<DashboardCountersResponseModel> getDashboardCounters(String instituteId) async{
    final response = await http.get(Constant.GET_DASHBOARD_COUNTERS+"?json={instituteid:$instituteId}");
    return DashboardCountersResponseModel.fromMap(json.decode(response.body));
  }

  static Future<ResolveQueryResponseModel> resolveQuery(ResolveQueryRequestModel resolveQueryRequestModel) async{
    print(json.encode(resolveQueryRequestModel));
    final response = await http.post(Constant.QUERY_RESOLVE_URL,body:json.encode(resolveQueryRequestModel));
    print(json.decode(response.body));
    return ResolveQueryResponseModel.fromMap(json.decode(response.body));
  }
}
