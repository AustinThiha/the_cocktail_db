part of 'cock_tail_list_bloc.dart';

@immutable
abstract class CockTailListEvent {}

class FetchCocktailListEvent extends CockTailListEvent {
  final String cName;

  FetchCocktailListEvent(this.cName);
}
