class AdsModel {
  int? id;
  String? title;
  String? image;
  String? city;
  String? province;
  String? price;
  String? createdAt;

  AdsModel(
      {this.id,
        this.title,
        this.image,
        this.city,
        this.province,
        this.price,
        this.createdAt});

  AdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    city = json['city'];
    province = json['province'];
    price = json['price'];
    createdAt = json['created_at'];
  }

}
