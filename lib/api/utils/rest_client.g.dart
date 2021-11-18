// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.thecocktaildb.com/api/json/v1/1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<CockTailDetails>> getDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'i': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<CockTailDetails>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/lookup.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<CockTailDetails>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse<CockTailCategory>> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<CockTailCategory>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/list.php?c=list',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<CockTailCategory>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse<Cocktail>> getCocktailList(categoryName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'c': categoryName};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<Cocktail>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/filter.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<Cocktail>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
