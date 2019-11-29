import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

}

class GetDashboardData extends DashboardEvent
{
  final String instituteId;

  GetDashboardData(this.instituteId);

  @override
  List<Object> get props => [instituteId];

}