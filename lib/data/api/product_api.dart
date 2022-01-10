import 'dart:convert';
import 'package:flutter_application_6/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");

    final response = await http.get(uri);
    final json = jsonDecode(response.body) as List<dynamic>;
    final listResult = json.map((e) => Product.fromJson(e)).toList();

    return listResult;
  }
}
