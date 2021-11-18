import 'package:flutter_retrofit_basic/models/cock_tail.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_category.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_details.dart';

class BaseResponse<T> {
  List<T>? data;

  BaseResponse({this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      data = [];
      if (T == CockTailDetails) {
        json['drinks'].forEach((v) {
          data!.add(CockTailDetails.fromJson(v) as T);
        });
      } else if (T == CockTailCategory) {
        json['drinks'].forEach((v) {
          data!.add(CockTailCategory.fromJson(v) as T);
        });
      } else if (T == Cocktail) {
        json['drinks'].forEach((v) {
          data!.add(Cocktail.fromJson(v) as T);
        });
      } else {
        throw Exception("Base Response Data type is missing");
      }
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (T == CockTailDetails) {
      json['drinks'] = data!.map((v) {
        final object = v as CockTailDetails;
        return object.toString();
      }).toList();
    } else if (T == CockTailCategory) {
      json['drinks'] = data!.map((v) {
        final object = v as CockTailCategory;
        return object.toString();
      }).toList();
    } else if (T == Cocktail) {
      json['drinks'] = data!.map((v) {
        final object = v as Cocktail;
        return object.toString();
      }).toList();
    } else {
      throw Exception("Base Response Data type is missing");
    }
    return json;
  }
}
