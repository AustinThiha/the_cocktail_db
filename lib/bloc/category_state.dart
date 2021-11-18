part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryFetchSuccessState extends CategoryState {
  final BaseResponse<CockTailCategory> baseResponse;

  CategoryFetchSuccessState(this.baseResponse);
}

class CategoryLoadingFail extends CategoryState {}
