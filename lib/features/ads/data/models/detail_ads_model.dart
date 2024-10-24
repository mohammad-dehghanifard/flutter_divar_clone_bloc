class DetailAdsModel {
  int? id;
  String? title;
  String? image;
  String? city;
  String? province;
  String? price;
  String? category;
  String? description;
  ContactInfo? contactInfo;
  String? createdAt;

  DetailAdsModel(
      {this.id,
        this.title,
        this.image,
        this.city,
        this.province,
        this.price,
        this.category,
        this.description,
        this.contactInfo,
        this.createdAt});

  DetailAdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    city = json['city'];
    province = json['province'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    contactInfo = json['contact_info'] != null
        ? ContactInfo.fromJson(json['contact_info'])
        : null;
    createdAt = json['created_at'];
  }

}

class ContactInfo {
  String? mobile;
  String? address;

  ContactInfo({this.mobile, this.address});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}