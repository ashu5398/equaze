/// escalated_count : "0"
/// closed_count : "10"
/// progress_count : "128"
/// student_count : "38"
/// raised_count : "153"
/// institute_count : "1"

class DashboardCountersResponseModel {
  String escalatedCount;
  String closedCount;
  String progressCount;
  String studentCount;
  String raisedCount;
  String instituteCount;

  static DashboardCountersResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DashboardCountersResponseModel dashboardCountersResponseModelBean = DashboardCountersResponseModel();
    dashboardCountersResponseModelBean.escalatedCount = map['escalated_count'];
    dashboardCountersResponseModelBean.closedCount = map['closed_count'];
    dashboardCountersResponseModelBean.progressCount = map['progress_count'];
    dashboardCountersResponseModelBean.studentCount = map['student_count'];
    dashboardCountersResponseModelBean.raisedCount = map['raised_count'];
    dashboardCountersResponseModelBean.instituteCount = map['institute_count'];
    return dashboardCountersResponseModelBean;
  }

  Map toJson() => {
    "escalated_count": escalatedCount,
    "closed_count": closedCount,
    "progress_count": progressCount,
    "student_count": studentCount,
    "raised_count": raisedCount,
    "institute_count": instituteCount,
  };
}