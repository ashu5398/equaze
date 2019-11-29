import 'package:equaze/ui/login_page.dart';

class Constant
{
    static const BASE_URL = "http://115.160.240.228:8180/equaze/api";
    static const GET_INSTITUTE_URL = BASE_URL+"/equaze/institutes/getInstituteList";
    static const LOGIN_URL = BASE_URL+"/equaze/egms/loginGrievanceService";
    static const DASHBOARD_URL = BASE_URL+"/equaze/institutes/getDashboardChartData";
    static const GET_GRIEVANCE_LIST = BASE_URL+"/equaze/userDepartment/getAllGrievances";
    static const GET_DASHBOARD_COUNTERS = BASE_URL+"/equaze/egmsgetcountersforhomepageservice/getCountersForHomePage1";
    static const QUERY_RESOLVE_URL = BASE_URL+"/equaze/egms/changeGrievanceStatus";

}