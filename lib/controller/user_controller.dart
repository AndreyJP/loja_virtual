import 'dart:convert';

import 'package:loja_virtual/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController{
  static final UserController instance = UserController();

  static const _baseURL = 'https://dummyjson.com/';

  Future<User> getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.get(
      Uri.parse('${_baseURL}users/${prefs.getInt('userId')}'),
      headers: <String, String>{
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Content-Type': 'application/json'
      },
    );

    //print(jsonDecode(response.body));

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Falha ao buscar usuário');
    }
  }


}