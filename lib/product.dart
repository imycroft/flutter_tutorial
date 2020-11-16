import 'dart:convert';

import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
class Product {
  String barCode;
  String name;
  double price;
  int quantity = 0;

  Product({this.barCode, this.name, this.price, this.quantity});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
        name: parsedJson['name'] as String,
        price: parsedJson['price'] as double,
        barCode: parsedJson['barCode'] as String,
        quantity: parsedJson['quantity'] as int);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barCode'] = this.barCode;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ProductViewModel {
  static List<Product> products;
  static Future<String> get _localPath async {
    PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    if(permissionResult == PermissionStatus.authorized) {
      final directory = await getApplicationDocumentsDirectory();

      return directory.path;
    }
    return null;
  }
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/products.json');
  }
  static Future<File> writeProduct(Product product) async {
    final file = await _localFile;
    String output = jsonEncode(product);
    // Write the file.
    PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
    if(permissionResult == PermissionStatus.authorized) {
      return file.writeAsString(output);
    }
    return null;
    // Return file.writeAsString();
  }
  static Future loadProducts() async {
    try {
      products = new List<Product>();

          final file = await _localFile;
          String jsonString = await file.readAsString();
          //print('$path/products.json');
          Map parsedJson = json.decode(jsonString);
          var categoryJson = parsedJson['products'] as List;
          for (int i = 0; i < categoryJson.length; i++) {
            products.add(new Product.fromJson(categoryJson[i]));
          }

    } catch (e) {
      print(e);
    }
  }
}
