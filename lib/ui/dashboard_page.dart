import 'package:equaze/bloc/bloc.dart';
import 'package:equaze/models/response_models/dashboard_counters_response_model.dart';
import 'package:equaze/models/response_models/dashboard_response_model.dart';
import 'package:equaze/ui/login_page.dart';
import 'package:equaze/ui/view_queries_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage>{
  final DashboardBloc _dashboardBloc = DashboardBloc();

  @override
  void initState() {
    getSharedPreferences("instituteId").then((result) {
      _dashboardBloc.dispatch(GetDashboardData(result));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _dashboardBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder(
              bloc: _dashboardBloc,
              builder: (BuildContext context, DashboardState state) {
                if (state is DashboardLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DashboardLoadingSuccessState) {
                  DashboardLoadingSuccessState successState = state;
                  return _buildSuccessState(
                      successState.dashboardResponseModel,successState.dashboardCountersResponseModel);
                } else {
                  return _buildFailedState();
                }
              }),
        ),
      ),
    );
  }

  Widget _buildPieChart(Map<String, double> pieChartData) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        child: PieChart(
          showChartValues: true,
          chartValuesColor: Colors.white,
          dataMap: pieChartData,
          colorList: [
            Color(0xff922D8F),
            Color(0xFFFFCB00),
            Color(0xFF61A60D),
            Color(0xFF497BC8),
          ],
        ),
      ),
    );
  }

  Widget _buildBlocs(int totalQuery, int closedQuery,
      int pendingQueries, int escalatedQuery) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/ic_total_query.svg",
                  height: 20,
                  width: 20,
                ),
                Text(
                  "Total Query",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  totalQuery.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/ic_query_closed.svg",
                  height: 20,
                  width: 20,
                ),
                Text(
                  "Query Closed",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  closedQuery.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/ic_query_progress.svg",
                  height: 20,
                  width: 20,
                ),
                Text(
                  "In Progress",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  pendingQueries.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/ic_query_escalated.svg",
                  height: 20,
                  width: 20,
                ),
                Text(
                  "Escalated",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  escalatedQuery.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenu() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewQueriesPage()));
              },
              child: Container(
                padding: EdgeInsets.all(40),
                color: Color(0xFFB53C12),
                child: Center(
                  child: Text(
                    "View All Queries",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 1,
          child: Material(
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(40),
                color: Color(0xFF459EE6),
                child: Center(
                  child: Text(
                    "Manage",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _buildSuccessState(DashboardResponseModel dashboardResponseModel, DashboardCountersResponseModel dashboardCountersResponseModel) {
    var pieChartList = Map<String, double>();

    dashboardResponseModel.pieChartList.forEach((Pie_chart_listBean bean) {
      pieChartList[bean.status] = double.parse(bean.percentage);
    });
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: <Widget>[
          _buildPieChart(pieChartList),
          SizedBox(
            height: 30,
          ),
          _buildBlocs(
            int.parse(dashboardCountersResponseModel.raisedCount),
            int.parse(dashboardCountersResponseModel.closedCount),
            int.parse(dashboardCountersResponseModel.progressCount),
            int.parse(dashboardCountersResponseModel.escalatedCount),
          ),
          SizedBox(
            height: 30,
          ),
          _buildMenu(),
        ],
      ),
    );
  }

  _buildFailedState() {
    return Center(
        child: Text("Something is wrong. Please contact administrator."));
  }

  @override
  void dispose() {
    _dashboardBloc.dispose();
    super.dispose();
  }
}
