import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equaze/repository/repository.dart';
import './bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  DashboardState get initialState => InitialDashboardState();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is GetDashboardData) {
      yield DashboardLoadingState();
      final dashboardModelResponse = await Repository.getDashboardData(event.instituteId);
      print(dashboardModelResponse);
      final dashboardCounterResponse = await Repository.getDashboardCounters(event.instituteId);
      print(dashboardCounterResponse);
      yield dashboardModelResponse.pieChartList.length == 0 || dashboardCounterResponse == null ? DashboardLoadingFailedState():DashboardLoadingSuccessState(dashboardModelResponse,dashboardCounterResponse);
    }
  }
}
