class MiningHistory {
  Data? data;
  String? message;
  int? status;

  MiningHistory({this.data, this.message, this.status});

  MiningHistory.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<DailyMiningHistory>? dailyMiningHistory;
  int? total;
  int? currentPage;
  int? perPage;
  bool? isNextPage;

  Data({this.dailyMiningHistory, this.total, this.currentPage, this.perPage, this.isNextPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['dailyMiningHistory'] != null) {
      dailyMiningHistory = <DailyMiningHistory>[];
      json['dailyMiningHistory'].forEach((v) {
        dailyMiningHistory!.add(new DailyMiningHistory.fromJson(v));
      });
    }
    total = json['total'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
    isNextPage = json['is_next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyMiningHistory != null) {
      data['dailyMiningHistory'] = this.dailyMiningHistory!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    data['is_next_page'] = this.isNextPage;
    return data;
  }
}

class DailyMiningHistory {
  int? id;
  String? date;
  String? startTime;
  String? endTime;
  String? mining;
  int? userId;
  dynamic isDeleted;
  String? startTimeTimestamp;
  String? endTimeTimestamp;
  int? appId;
  int? isMining;
  dynamic createdAt;
  dynamic updatedAt;

  DailyMiningHistory(
      {this.id,
      this.date,
      this.startTime,
      this.endTime,
      this.mining,
      this.userId,
      this.isDeleted,
      this.startTimeTimestamp,
      this.endTimeTimestamp,
      this.appId,
      this.isMining,
      this.createdAt,
      this.updatedAt});

  DailyMiningHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    mining = json['mining'].toString();
    userId = json['user_id'];
    isDeleted = json['is_deleted'];
    startTimeTimestamp = json['start_time_timestamp'];
    endTimeTimestamp = json['end_time_timestamp'];
    appId = json['app_id'];
    isMining = json['is_mining'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['mining'] = this.mining;
    data['user_id'] = this.userId;
    data['is_deleted'] = this.isDeleted;
    data['start_time_timestamp'] = this.startTimeTimestamp;
    data['end_time_timestamp'] = this.endTimeTimestamp;
    data['app_id'] = this.appId;
    data['is_mining'] = this.isMining;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
