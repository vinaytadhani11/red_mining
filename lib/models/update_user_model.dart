class UpdateUserModel {
  bool? success;
  Data? data;
  String? message;

  UpdateUserModel({this.success, this.data, this.message});

  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? uID;
  String? email;
  String? country;
  int? appId;
  String? userKey;

  Data({this.id, this.firstName, this.lastName, this.uID, this.email, this.country, this.appId, this.userKey});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    uID = json['UID'];
    email = json['email'];
    country = json['country'];
    appId = json['app_id'];
    userKey = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['UID'] = this.uID;
    data['email'] = this.email;
    data['country'] = this.country;
    data['app_id'] = this.appId;
    data['user_key'] = this.userKey;
    return data;
  }
}
