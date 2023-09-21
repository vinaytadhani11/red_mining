class UpGradePlanModel {
  bool? success;
  List<UPData>? data;
  String? message;

  UpGradePlanModel({this.success, this.data, this.message});

  UpGradePlanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <UPData>[];
      json['data'].forEach((v) {
        data!.add(new UPData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class UPData {
  int? id;
  String? planName;
  int? price;
  int? active;
  int? speed;
  int? contract;
  String? minimumWithdraw;
  String? availability;
  String? category;
  int? appId;
  dynamic image;
  dynamic imagePath;
  String? createdAt;
  String? updatedAt;

  UPData(
      {this.id,
      this.planName,
      this.price,
      this.active,
      this.speed,
      this.contract,
      this.minimumWithdraw,
      this.availability,
      this.category,
      this.appId,
      this.image,
      this.imagePath,
      this.createdAt,
      this.updatedAt});

  UPData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    price = json['price'];
    active = json['active'];
    speed = json['speed'];
    contract = json['contract'];
    minimumWithdraw = json['minimum_withdraw'];
    availability = json['availability'];
    category = json['category'];
    appId = json['app_id'];
    image = json['image'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['price'] = this.price;
    data['active'] = this.active;
    data['speed'] = this.speed;
    data['contract'] = this.contract;
    data['minimum_withdraw'] = this.minimumWithdraw;
    data['availability'] = this.availability;
    data['category'] = this.category;
    data['app_id'] = this.appId;
    data['image'] = this.image;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
