import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:youtube_project/network_call/base_network.dart';
import 'package:youtube_project/network_call/base_response.dart';




class LoginManager {
  Future<dynamic> createLoginToken(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    Response response = await dioClient.tokenRef.post("http://sowmyamatsa.pythonanywhere.com/api/token/", data: formData,);

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // here the issuw is with the if statement
      // in the response we dont have a key named status  so that is the reason
      // response.data['status'] returned null when comparing this kind of dynamic data its better to user == true
      // Okay?
      print(response.data);
      if (response.statusCode==200) {
        prefs.setString("token", response.data['access']);
        print(response);
        return ResponseData("", ResponseStatus.SUCCESS,
            data: response.data);

      } else {
        return ResponseData(response.data['message'], ResponseStatus.FAILED, data: null);
      }
    } else {
      return ResponseData("Failed to get data", ResponseStatus.FAILED, data: null);
    }
  }
}

final loginManager = LoginManager();