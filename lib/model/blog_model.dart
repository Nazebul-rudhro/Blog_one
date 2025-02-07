import 'dart:convert';

class BlogModel {
  int? id;
  String? title;
  String? img;
  String? short;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  BlogModel(
      {this.id,
      this.title,
      this.img,
      this.short,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    short = json['short'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


 static List<BlogModel> fromJsonList(String jsonString) {
   final List<dynamic> data = jsonDecode(jsonString);

    return data.map((blogmodel) => BlogModel.fromJson(blogmodel)).toList();
  }


}



