class LeaderboardModel {
  bool? success;
  Data? data;
  String? message;

  LeaderboardModel({this.success, this.data, this.message});

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? currentPage;
  String? firstPageUrl;
  String? lastPageUrl;
  dynamic nextPageUrl;
  int? perPage;
  bool? isNextPage;
  List<Users>? users;

  Data({this.total, this.currentPage, this.firstPageUrl, this.lastPageUrl, this.nextPageUrl, this.perPage, this.isNextPage, this.users});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    perPage = json['per_page'];
    isNextPage = json['is_next_page'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['current_page'] = this.currentPage;
    data['first_page_url'] = this.firstPageUrl;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['per_page'] = this.perPage;
    data['is_next_page'] = this.isNextPage;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
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
  String? mining;
  int? subscription;

  Users(
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
      this.mining,
      this.subscription});

  Users.fromJson(Map<String, dynamic> json) {
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
    mining = json['mining'];
    subscription = json['subscription'];
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
    data['mining'] = this.mining;
    data['subscription'] = this.subscription;
    return data;
  }
}
