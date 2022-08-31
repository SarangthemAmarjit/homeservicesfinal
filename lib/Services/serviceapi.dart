import 'dart:convert';
import 'dart:developer';
import 'package:homeservice/model/model.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<List<ItemModel>?> Getdata() async {
    final response = await http.get(Uri.parse(
        'https://ehomeservice-722a5-default-rtdb.asia-southeast1.firebasedatabase.app/ehomeservices1.json'));
    final data = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      var users = data.map((e) => ItemModel.fromJson(e)).toList();
      log('Successfully Shown Profile');
      return users;
    } else {
      log('Failed to Getdata.');
    }
  }
}
