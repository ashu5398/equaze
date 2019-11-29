class DashboardResponseModel {
  String responseCode;
  List<Pie_chart_listBean> pieChartList;

  static DashboardResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DashboardResponseModel dashboardResponseModelBean = DashboardResponseModel();
    dashboardResponseModelBean.responseCode = map['response_code'];
    dashboardResponseModelBean.pieChartList = List()..addAll(
      (map['pie_chart_list'] as List ?? []).map((o) => Pie_chart_listBean.fromMap(o))
    );
    return dashboardResponseModelBean;
  }

  Map toJson() => {
    "response_code": responseCode,
    "pie_chart_list": pieChartList,
  };
}

class Pie_chart_listBean {
  String status;
  String percentage;

  static Pie_chart_listBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Pie_chart_listBean pie_chart_listBean = Pie_chart_listBean();
    pie_chart_listBean.status = map['status'];
    pie_chart_listBean.percentage = map['percentage'];
    return pie_chart_listBean;
  }

  Map toJson() => {
    "status": status,
    "percentage": percentage,
  };
}