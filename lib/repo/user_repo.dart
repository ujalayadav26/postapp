import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:telegramflutter/Models/user_model.dart';



class UserRepo{

  Future<UserModel> getAllUserPosts() async {
    try {
      final response = await http.get(Uri.parse(
          "https://dummyjson.com/posts"));
      final Map<String, dynamic> jsonresponse = jsonDecode(response.body);
      UserModel usermodel = UserModel.fromJson(jsonresponse);
      print(usermodel.posts![4].title);
      return usermodel;
    } catch (e) {
      print(e.toString());
      throw(e);
    }
  }
}