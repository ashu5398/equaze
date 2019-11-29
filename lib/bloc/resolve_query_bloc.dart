import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equaze/repository/repository.dart';
import './bloc.dart';

class ResolveQueryBloc extends Bloc<ResolveQueryEvent, ResolveQueryState> {
  @override
  ResolveQueryState get initialState => InitialResolveQueryState();

  @override
  Stream<ResolveQueryState> mapEventToState(
    ResolveQueryEvent event,
  ) async* {
    if(event is ResolveQuery)
      {
        yield ResolvingQueryState();
        final response = await Repository.resolveQuery(event.resolveQueryRequestModel);
        yield response.responseCode == "00" ? QueryResolvedSuccessState(response) : QueryResolvedFailedState(response);
      }
    else if(event is InitialQueryStateEvent)
      {
        yield InitialResolveQueryState();
      }
  }
}
