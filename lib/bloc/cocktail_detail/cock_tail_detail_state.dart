part of 'cock_tail_detail_bloc.dart';

@immutable
abstract class CockTailDetailState {}

class CockTailDetailInitial extends CockTailDetailState {}

class CockTailDetailLoading extends CockTailDetailState {}

class CockTailDetailLoadingSuccess extends CockTailDetailState {
  final BaseResponse<CockTailDetails> baseResponse;

  CockTailDetailLoadingSuccess(this.baseResponse);
}

class CockTailDetailLoadingFail extends CockTailDetailState {}
