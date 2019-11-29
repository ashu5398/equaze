import 'package:equatable/equatable.dart';
import 'package:equaze/models/response_models/dashboard_counters_response_model.dart';
import 'package:equaze/models/response_models/dashboard_response_model.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class InitialDashboardState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => null;
}

class DashboardLoadingSuccessState extends DashboardState {
  final DashboardResponseModel dashboardResponseModel;
  final DashboardCountersResponseModel dashboardCountersResponseModel;

  DashboardLoadingSuccessState(this.dashboardResponseModel,this.dashboardCountersResponseModel);
  @override
  List<Object> get props => [dashboardResponseModel,dashboardCountersResponseModel];
}

class DashboardLoadingFailedState extends DashboardState {
  @override
  List<Object> get props => null;
}
