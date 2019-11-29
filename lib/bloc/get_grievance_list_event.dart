import 'package:equatable/equatable.dart';
import 'package:equaze/models/request_models/get_grievance_list_request_model.dart';

abstract class GetGrievanceListEvent extends Equatable {
  const GetGrievanceListEvent();
}

class GetGrievanceResponseEvent extends GetGrievanceListEvent
{
  final GetGrievanceListRequestModel getGrievanceListRequestModel;

  GetGrievanceResponseEvent(this.getGrievanceListRequestModel);

  @override
  List<Object> get props => [getGrievanceListRequestModel];

}
