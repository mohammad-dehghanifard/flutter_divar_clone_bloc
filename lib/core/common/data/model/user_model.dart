class UserModel {
  int? id;
  String? name;
  String? mobile;
  String? avatar;
  String? city;
  String? province;
  int? cityId;
  int? provinceId;

  UserModel(
      {this.id,
        this.name,
        this.mobile,
        this.avatar,
        this.city,
        this.province,
        this.cityId,
        this.provinceId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    avatar = json['avatar'];
    city = json['city'];
    province = json['province'];
    cityId = json['city_id'];
    provinceId = json['province_id'];
  }

}