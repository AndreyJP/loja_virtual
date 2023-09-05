import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class AcessController{
  static final AcessController instance = AcessController();

  static const _baseURL = 'https://dummyjson.com/';

  late SharedPreferences _prefs;

  Future<bool> verificarToken() async{
    _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    if(token != null && !JwtDecoder.isExpired(token)){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> login(String username, String passwd) async{

    _prefs = await SharedPreferences.getInstance();

    http.Response response = await http.post(
      Uri.parse('${_baseURL}auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'username': 'kminchelle',
        'password': '0lelplR',
      })
    );

    if(response.statusCode == 200){
      _prefs.setString('token', json.decode(response.body)['token']);
      _prefs.setInt('userId', json.decode(response.body)['id']);

      // Map<String,dynamic> decodedToken = JwtDecoder.decode(json.decode(response.body)['token']);

      // print(decodedToken);
      // print(JwtDecoder.getExpirationDate(json.decode(response.body)['token']));

      return true;
    }else{
      return false;
    }
  }

  Future<bool> logout() async{
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    return true;
  }
}