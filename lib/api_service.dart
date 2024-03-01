import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:listview_api/constants.dart';
import 'package:listview_api/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel?> getUserById(int userId) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + '/$userId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        UserModel userModel = userModelFromJson(response.body);
        return userModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null; // Return null if any error occurs or if user with given ID is not found
  }
}
