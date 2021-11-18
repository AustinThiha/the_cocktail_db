
import 'package:bloc/bloc.dart';
import 'package:flutter_retrofit_basic/api/utils/rest_client.dart';
import 'package:flutter_retrofit_basic/models/base_response.dart';
import 'package:flutter_retrofit_basic/models/cock_tail.dart';
import 'package:meta/meta.dart';

part 'cock_tail_list_event.dart';
part 'cock_tail_list_state.dart';

class CockTailListBloc extends Bloc<CockTailListEvent, CockTailListState> {
  final RestClient restClient;

  CockTailListBloc(this.restClient) : super(CockTailListInitial()) {
    on<CockTailListEvent>((event, emit) async {
      if (event is FetchCocktailListEvent) {
        // try {
        emit.call(CockTailListLoadingState());
        final baseResponse = await restClient.getCocktailList(event.cName);
        if (baseResponse.data!.isEmpty) {
          emit.call(CockTailListFetchFailState());
        } else {
          emit.call(CockTailListFetchSuccessState(baseResponse));
        }
        // } catch (e) {
        //   emit.call(CockTailListFetchFailState());
        // }
      }
    });
  }
}
