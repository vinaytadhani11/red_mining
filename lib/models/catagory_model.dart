class SelectCatogoryModel {
  String? message;
  Data? data;

  SelectCatogoryModel({this.message, this.data});

  SelectCatogoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Category>? category;
  List<QueryS>? query;

  Data({this.category});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['query'] != null) {
      query = <QueryS>[];
      json['query'].forEach((v) {
        query!.add(new QueryS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.query != null) {
      data['query'] = this.query!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class QueryS {
  int? id;
  String? title;
  String? description;
  int? categoryId;
  String? categoryName;
  String? status;
  String? photo;
  String? createdAt;

  QueryS({this.id, this.title, this.description, this.categoryId, this.categoryName, this.status, this.photo, this.createdAt});

  QueryS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    status = json['status'].toString();
    photo = json['photo'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    return data;
  }
}
