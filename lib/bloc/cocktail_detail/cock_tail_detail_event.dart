part of 'cock_tail_detail_bloc.dart';

@immutable
abstract class CockTailDetailEvent {}

class FetchCockTailDetailEvent extends CockTailDetailEvent {
  final String id;

  FetchCockTailDetailEvent(this.id);
}
