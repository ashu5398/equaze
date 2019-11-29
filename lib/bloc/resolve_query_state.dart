import 'package:equatable/equatable.dart';

abstract class ResolveQueryState extends Equatable {
  const ResolveQueryState();
}

class InitialResolveQueryState extends ResolveQueryState {
  @override
  List<Object> get props => [];
}

class ResolvingQueryState extends ResolveQueryState{
  @override
  List<Object> get props => [];
}

class QueryResolvedSuccessState extends ResolveQueryState{
  final resolveQueryResponseModel;

  QueryResolvedSuccessState(this.resolveQueryResponseModel);

  @override
  List<Object> get props => [resolveQueryResponseModel];

}

class QueryResolvedFailedState extends ResolveQueryState{
  final resolveQueryResponseModel;

  QueryResolvedFailedState(this.resolveQueryResponseModel);

  @override
  List<Object> get props => [resolveQueryResponseModel];



}
