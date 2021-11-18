part of 'cock_tail_list_bloc.dart';

@immutable
abstract class CockTailListState {}

class CockTailListInitial extends CockTailListState {}

class CockTailListLoadingState extends CockTailListState {}

class CockTailListFetchSuccessState extends CockTailListState {
  final BaseResponse<Cocktail> baseResponse;

  CockTailListFetchSuccessState(this.baseResponse);
}

class CockTailListFetchFailState extends CockTailListState {}
