class MessageModel {
  String? message;
  MData? data;

  MessageModel({this.message, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new MData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MData {
  String? title;
  int? status;
  int? categoryId;
  String? category;
  List<Message>? message;

  MData({this.title, this.status, this.categoryId, this.category, this.message});

  MData.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    status = json['Status'];
    categoryId = json['category_id'];
    category = json['category'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Status'] = this.status;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? messageId;
  int? isAdmin;
  String? message;
  String? photo;
  int? status;
  String? createdAt;

  Message({this.messageId, this.isAdmin, this.message, this.photo, this.status, this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    isAdmin = json['is_admin'];
    message = json['message'];
    photo = json['photo'].toString();
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['is_admin'] = this.isAdmin;
    data['message'] = this.message;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
