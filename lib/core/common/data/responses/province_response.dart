import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';

class ProvinceResponse {
  List<ProvinceModel>? provinces;

  ProvinceResponse({this.provinces});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      provinces = <ProvinceModel>[];
      json['data'].forEach((v) {
        provinces!.add(ProvinceModel.fromJson(v));
      });
    }
  }

}