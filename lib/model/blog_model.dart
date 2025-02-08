// class BlogModel {
//   PostDetails? postDetails;
//   List<PostComments>? postComments;

//   BlogModel({this.postDetails, this.postComments});

//   BlogModel.fromJson(Map<String, dynamic> json) {
//     postDetails = json['postDetails'] != null
//         ? new PostDetails.fromJson(json['postDetails'])
//         : null;
//     if (json['postComments'] != null) {
//       postComments = <PostComments>[];
//       json['postComments'].forEach((v) {
//         postComments!.add(new PostComments.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.postDetails != null) {
//       data['postDetails'] = this.postDetails!.toJson();
//     }
//     if (this.postComments != null) {
//       data['postComments'] = this.postComments!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class PostDetails {
//   int? id;
//   int? listId;
//   String? img;
//   String? content;
//   String? createdAt;
//   String? updatedAt;

//   PostDetails(
//       {this.id,
//       this.listId,
//       this.img,
//       this.content,
//       this.createdAt,
//       this.updatedAt});

//   PostDetails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     listId = json['list_id'];
//     img = json['img'];
//     content = json['content'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['list_id'] = this.listId;
//     data['img'] = this.img;
//     data['content'] = this.content;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class PostComments {
//   int? id;
//   int? listId;
//   String? author;
//   String? comment;
//   String? createdAt;
//   String? updatedAt;

//   PostComments(
//       {this.id,
//       this.listId,
//       this.author,
//       this.comment,
//       this.createdAt,
//       this.updatedAt});

//   PostComments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     listId = json['list_id'];
//     author = json['author'];
//     comment = json['comment'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['list_id'] = this.listId;
//     data['author'] = this.author;
//     data['comment'] = this.comment;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }


// // factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
// //         id: json["id"],
// //         name: json["name"],
// //         createdAt: json["created_at"],
// //         updatedAt: json["updated_at"],
// //       );
