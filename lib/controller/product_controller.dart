import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loja_virtual/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController {
  static final ProductController instance = ProductController();

  static const _baseURL = 'https://dummyjson.com/';
  late SharedPreferences _prefs;

  Future<List<Product>> getProductList() async {
    _prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(
      Uri.parse('${_baseURL}products'),
      headers: <String, String>{
        'Authorization': 'Bearer ${_prefs.get('token')}',
        'Content-Type': 'application/json'
      },
    );

    //print(response.body);

    if (response.statusCode == 200) {
      List<Product> products = [];
      Map results = jsonDecode(response.body);

      results['products'].forEach(
        (productResult) {
          Product product = Product.fromJson(productResult);
          products.add(product);
        },
      );
      return products;
    } else {
      throw Exception('Falha ao buscar produtos');
    }
  }
}
