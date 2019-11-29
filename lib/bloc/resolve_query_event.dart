import 'package:equatable/equatable.dart';

abstract class ResolveQueryEvent extends Equatable {
  const ResolveQueryEvent();
}
class ResolveQuery extends ResolveQueryEvent
{
  final resolveQueryRequestModel;

  ResolveQuery(this.resolveQueryRequestModel);

  @override
  List<Object> get props => [resolveQueryRequestModel];
}

class InitialQueryStateEvent extends ResolveQueryEvent
{
  @override
  List<Object> get props => [];

}
