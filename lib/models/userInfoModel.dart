class UserInfoModel {
  bool? success;
  Data? data;
  String? message;

  UserInfoModel({this.success, this.data, this.message});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? referralCode;
  dynamic referralBy;
  int? planId;
  String? planName;
  int? hasRateSpeed;
  dynamic? miningPoint;
  String? totalEarning;
  String? totalWithdrawl;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.uID,
      this.email,
      this.country,
      this.appId,
      this.userKey,
      this.referralCode,
      this.referralBy,
      this.planId,
      this.planName,
      this.hasRateSpeed,
      this.miningPoint,
      this.totalEarning,
      this.totalWithdrawl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    uID = json['UID'];
    email = json['email'];
    country = json['country'];
    appId = json['app_id'];
    userKey = json['user_key'];
    referralCode = json['referral_code'];
    referralBy = json['referral_by'];
    planId = json['plan_id'];
    planName = json['plan_name'];
    hasRateSpeed = json['has_rate_speed'];
    miningPoint = json['mining_point'];
    totalEarning = json['total_earning'];
    totalWithdrawl = json['total_withdrawl'];
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
    data['referral_code'] = this.referralCode;
    data['referral_by'] = this.referralBy;
    data['plan_id'] = this.planId;
    data['plan_name'] = this.planName;
    data['has_rate_speed'] = this.hasRateSpeed;
    data['mining_point'] = this.miningPoint;
    data['total_earning'] = this.totalEarning;
    data['total_withdrawl'] = this.totalWithdrawl;
    return data;
  }
}
