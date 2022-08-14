import 'dart:convert';

import 'package:electronicshop/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NetworkHandler {
  Future<dynamic> requestToServer(String url) async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        var data = result['data']['product'];
        List<Product> productList = [];
        final dateformat = DateFormat('dd-MM-yyyy');

        for (int i = 0; i < data.length; i++) {
          int id = data[i]['id'];
          String name = data[i]['name'];
          String image = data[i]['image'];
          String price = 
              (127 * (int.parse((data[i]['price']).replaceAll(RegExp('[^A-Za-z0-9]'), '')))).toString();
          int stock = data[i]['stock'];
          String createDate = dateformat.format(
              DateTime.fromMillisecondsSinceEpoch(data[i]['createDate']));
          List<dynamic> category = data[i]['category'];

          Product product = Product(
              id: id,
              name: name,
              image: image,
              price: price,
              stock: stock,
              createDate: createDate,
              category: category);
          productList.add(product);
        }
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
