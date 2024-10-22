class ProvinceModel {
  int? id;
  String? name;
  List<CityModel>? cities;

  ProvinceModel({this.id, this.name, this.cities});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <CityModel>[];
      json['cities'].forEach((v) {
        cities!.add(CityModel.fromJson(v));
      });
    }
  }

}

class CityModel {
  int? id;
  String? name;
  int? provinceId;

  CityModel({this.id, this.name, this.provinceId});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
  }

}
