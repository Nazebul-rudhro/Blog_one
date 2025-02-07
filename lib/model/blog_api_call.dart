// import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_blog_app/model/blog_model.dart';

class Blogapicall {
  static const uri = "https://basic-blog.teamrabbil.com";
 static Future<List<BlogModel>> fetchGetList()async{
  
  final response = await http.get(Uri.parse('$uri/api/post-details/1'));
  // print(response.body);
  
  if(response.statusCode == 200){
    return BlogModel.fromJsonList(response.body);
  }else{
    throw Exception("Failed to load blogs");
  }
 }

}
