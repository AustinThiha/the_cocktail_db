import 'package:bloc/bloc.dart';
import 'package:flutter_retrofit_basic/api/utils/rest_client.dart';
import 'package:flutter_retrofit_basic/models/base_response.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_category.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(RestClient restClient) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is FetchCategories) {
        emit.call(CategoryLoadingState());
        try {
          BaseResponse<CockTailCategory> baseResponse =
              await restClient.getCategories();

          if (baseResponse.data == null || baseResponse.data!.isEmpty) {
            emit(CategoryLoadingFail());
          } else {
            baseResponse.data!.sort(
                (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
            emit.call(CategoryFetchSuccessState(baseResponse));
          }
        } catch (e) {
          emit(CategoryLoadingFail());
        }
      }
    });
  }
}
