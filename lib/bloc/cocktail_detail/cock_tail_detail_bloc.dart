import 'package:bloc/bloc.dart';
import 'package:flutter_retrofit_basic/api/utils/rest_client.dart';
import 'package:flutter_retrofit_basic/models/base_response.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_details.dart';
import 'package:meta/meta.dart';

part 'cock_tail_detail_event.dart';

part 'cock_tail_detail_state.dart';

class CockTailDetailBloc
    extends Bloc<CockTailDetailEvent, CockTailDetailState> {
  final RestClient restClient;

  CockTailDetailBloc(this.restClient) : super(CockTailDetailInitial()) {
    on<CockTailDetailEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is FetchCockTailDetailEvent) {
        try {
          emit.call(CockTailDetailLoading());
          BaseResponse<CockTailDetails> baseResponse =
              await restClient.getDetails(event.id);
          emit.call(CockTailDetailLoadingSuccess(baseResponse));
        } catch (e) {
          emit.call(CockTailDetailLoadingFail());
        }
      }
    });
  }
}
