// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:youtube_project/network_call/base_network.dart';

// import 'package:youtube_project/network_call/base_response.dart';




// class MobilePageManager {
//   factory MobilePageManager() {
//     return _singleton;
//   }

//   MobilePageManager._internal();

//   static final MobilePageManager _singleton = MobilePageManager._internal();

//   Future<ResponseData> fetchMobilePage(String type) async {
//     // final formData = FormData.fromMap({
//     //   "search_text": "HOME",
//     //
//     // });

//     Response response;
//     try {
//       response = await dioClient.ref
//           .get<dynamic>("/category/?category_id=1");

//       if(response.statusCode == 200) {
//         //final membershipModel = mobilePagesModelsFromMap(jsonEncode(response.data));
//         return ResponseData("", ResponseStatus.SUCCESS, );
//       } else {
//         var message = "Unknown error";
//         if(response.data?.containsKey("message") == true){
//           message = response.data['message'];
//         }
//         return ResponseData(message, ResponseStatus.FAILED);
//       }
//     } on Exception catch (err) {
//       return ResponseData<dynamic>( "something problem at serverside", ResponseStatus.FAILED);
//     }
//   }
// }

// MobilePageManager mobilePageManager = MobilePageManager();


import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:youtube_project/models/categories.dart';
import 'package:youtube_project/network_call/base_network.dart';
import 'package:youtube_project/network_call/base_response.dart';
import 'package:youtube_project/utils/urls.dart';


class CategoriesManager {
  factory CategoriesManager() {
    return _singleton;
  }

  CategoriesManager._internal();

  static final CategoriesManager _singleton = CategoriesManager._internal();

  Future<ResponseData> fetchCategories( ) async {

    Response response;
    try {
      response = await dioClient.ref
          .get<dynamic>(URLS.baseUrl+"/category/?category_id=1");

      if(response.statusCode == 200) {
        CategoriesModel categoriesModel;
        categoriesModel = categoriesModelFromMap(jsonEncode(response.data));
        return ResponseData("success", ResponseStatus.SUCCESS ,data: categoriesModel);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( 'Please check your internet', ResponseStatus.FAILED);
    }
  }


}

CategoriesManager categoriesManager = CategoriesManager() ;