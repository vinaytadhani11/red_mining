class SocketIoModel {
  String? timeString;
  String? mining;
  String? userKey;
  int? appId;
  String? currentSpeed;
  bool? isMiningStart;
  Data? data;

  SocketIoModel({this.timeString, this.mining, this.userKey, this.appId, this.currentSpeed, this.isMiningStart, this.data});

  SocketIoModel.fromJson(Map<String, dynamic> json) {
    timeString = json['timeString'];
    mining = json['mining'];
    userKey = json['user_key'];
    appId = json['appId'];
    currentSpeed = json['currentSpeed'].toString();
    isMiningStart = json['isMiningStart'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeString'] = this.timeString;
    data['mining'] = this.mining;
    data['user_key'] = this.userKey;
    data['appId'] = this.appId;
    data['currentSpeed'] = this.currentSpeed;
    data['isMiningStart'] = this.isMiningStart;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<int>? qq;
  String? currentMining;
  TodayM? todayM;
  TtM? ttM;
  WithdrawHistory? withdrawHistory;
  ReferralPoint? referralPoint;
  List<UserDetail>? userDetail;

  Data({this.qq, this.currentMining, this.todayM, this.ttM, this.withdrawHistory, this.referralPoint, this.userDetail});

  Data.fromJson(Map<String, dynamic> json) {
    qq = json['qq'].cast<int>();
    currentMining = json['currentMining'];
    todayM = json['todayM'] != null ? new TodayM.fromJson(json['todayM']) : null;
    ttM = json['ttM'] != null ? new TtM.fromJson(json['ttM']) : null;
    withdrawHistory = json['withdrawHistory'] != null ? new WithdrawHistory.fromJson(json['withdrawHistory']) : null;
    referralPoint = json['referral_point'] != null ? new ReferralPoint.fromJson(json['referral_point']) : null;
    if (json['userDetail'] != null) {
      userDetail = <UserDetail>[];
      json['userDetail'].forEach((v) {
        userDetail!.add(new UserDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qq'] = this.qq;
    data['currentMining'] = this.currentMining;
    if (this.todayM != null) {
      data['todayM'] = this.todayM!.toJson();
    }
    if (this.ttM != null) {
      data['ttM'] = this.ttM!.toJson();
    }
    if (this.withdrawHistory != null) {
      data['withdrawHistory'] = this.withdrawHistory!.toJson();
    }
    if (this.referralPoint != null) {
      data['referral_point'] = this.referralPoint!.toJson();
    }
    if (this.userDetail != null) {
      data['userDetail'] = this.userDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodayM {
  String? t;
  String? miningPoints;

  TodayM({this.t, this.miningPoints});

  TodayM.fromJson(Map<String, dynamic> json) {
    t = json['t'].toString();
    miningPoints = json['miningPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    data['miningPoints'] = this.miningPoints;
    return data;
  }
}

class TtM {
  String? tt;
  String? miningPoints;

  TtM({this.tt, this.miningPoints});

  TtM.fromJson(Map<String, dynamic> json) {
    tt = json['tt'].toString();
    miningPoints = json['miningPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tt'] = this.tt;
    data['miningPoints'] = this.miningPoints;
    return data;
  }
}

class WithdrawHistory {
  int? wh;
  String? miningPoints;

  WithdrawHistory({this.wh, this.miningPoints});

  WithdrawHistory.fromJson(Map<String, dynamic> json) {
    wh = json['wh'];
    miningPoints = json['miningPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wh'] = this.wh;
    data['miningPoints'] = this.miningPoints;
    return data;
  }
}

class ReferralPoint {
  int? referralPoint;
  int? checkReferral;
  String? miningPoints;

  ReferralPoint({this.referralPoint, this.checkReferral, this.miningPoints});

  ReferralPoint.fromJson(Map<String, dynamic> json) {
    referralPoint = json['referral_point'];
    checkReferral = json['checkReferral'];
    miningPoints = json['miningPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referral_point'] = this.referralPoint;
    data['checkReferral'] = this.checkReferral;
    data['miningPoints'] = this.miningPoints;
    return data;
  }
}

class UserDetail {
  int? id;
  String? userKey;
  String? referralPoint;
  dynamic totalReferralPoints;
  dynamic totalWithdraw;
  String? totalMining;
  int? currentSpeed;
  String? currentMining;
  dynamic todayMining;
  int? dmid;
  String? startTimeTimestamp;
  String? endTimeTimestamp;

  UserDetail(
      {this.id,
      this.userKey,
      this.referralPoint,
      this.totalReferralPoints,
      this.totalWithdraw,
      this.totalMining,
      this.currentSpeed,
      this.currentMining,
      this.todayMining,
      this.dmid,
      this.startTimeTimestamp,
      this.endTimeTimestamp});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userKey = json['user_key'];
    referralPoint = json['referral_point'];
    totalReferralPoints = json['total_referral_points'];
    totalWithdraw = json['total_withdraw'];
    totalMining = json['total_mining'];
    currentSpeed = json['currentSpeed'];
    currentMining = json['currentMining'];
    todayMining = json['todayMining'];
    dmid = json['dmid'];
    startTimeTimestamp = json['start_time_timestamp'];
    endTimeTimestamp = json['end_time_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_key'] = this.userKey;
    data['referral_point'] = this.referralPoint;
    data['total_referral_points'] = this.totalReferralPoints;
    data['total_withdraw'] = this.totalWithdraw;
    data['total_mining'] = this.totalMining;
    data['currentSpeed'] = this.currentSpeed;
    data['currentMining'] = this.currentMining;
    data['todayMining'] = this.todayMining;
    data['dmid'] = this.dmid;
    data['start_time_timestamp'] = this.startTimeTimestamp;
    data['end_time_timestamp'] = this.endTimeTimestamp;
    return data;
  }
}
