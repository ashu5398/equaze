import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equaze/repository/repository.dart';
import './bloc.dart';

class GetGrievanceListBloc extends Bloc<GetGrievanceListEvent, GetGrievanceListState> {
  @override
  GetGrievanceListState get initialState => InitialGetGrievanceListState();

  @override
  Stream<GetGrievanceListState> mapEventToState(
    GetGrievanceListEvent event,
  ) async* {
    if(event is GetGrievanceResponseEvent)
    {
      yield GrievanceLoadingState();
      final response = await Repository.getGrievanceList(event.getGrievanceListRequestModel);
      yield response == null ? GrievanceLoadingFailedState() : GrievanceLoadingSuccessState(response);
    }
  }
}
