import 'package:equatable/equatable.dart';
import 'package:equaze/models/response_models/grievance_list_response_model.dart';

abstract class GetGrievanceListState extends Equatable {
  const GetGrievanceListState();
}

class InitialGetGrievanceListState extends GetGrievanceListState {
  @override
  List<Object> get props => [];
}

class GrievanceLoadingState extends GetGrievanceListState
{
  @override
  List<Object> get props => null;

}

class GrievanceLoadingSuccessState extends GetGrievanceListState
{
  final List<GrievanceListResponseModel> grievanceListResponseModel;

  GrievanceLoadingSuccessState(this.grievanceListResponseModel);

  @override
  List<Object> get props => [grievanceListResponseModel];

}

class GrievanceLoadingFailedState extends GetGrievanceListState
{
  List<Object> get props => null;

}
