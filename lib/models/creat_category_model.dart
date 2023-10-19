class CreatedCategoryModel {
  String? message;
  List<Query>? query;

  CreatedCategoryModel({this.message, this.query});

  CreatedCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['query'] != null) {
      query = <Query>[];
      json['query'].forEach((v) {
        query!.add(new Query.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.query != null) {
      data['query'] = this.query!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Query {
  int? id;
  String? title;
  String? description;
  int? categoryId;
  String? categoryName;
  int? status;
  String? photo;
  String? createdAt;

  Query({this.id, this.title, this.description, this.categoryId, this.categoryName, this.status, this.photo, this.createdAt});

  Query.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    status = json['status'];
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
