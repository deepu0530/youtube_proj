

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_project/managers/home_manager.dart';

import 'package:youtube_project/models/categories.dart';
import 'package:youtube_project/network_call/base_network.dart';
import 'package:youtube_project/network_call/base_response.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   bool _loading = true;
  CategoriesModel? _categoriesModel;
  Future<void> fetchCategories() async {
    setState(() {
      _loading = true;
    });

    final response = await categoriesManager.fetchCategories();

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg:response.message);
   setState(() {
     _categoriesModel = response.data;
   });
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg:response.message);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();

  }
  
  // bool _fetching = true;

  // CategoryModel? categories;

  // void fetch_categories() async {
  //   setState(() {
  //     _fetching = true;
  //   });
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? access = prefs.get("access") as String?;
  //     Response response = await dioClient.ref.get("/category/?category_id=1",
  //         options: Options(validateStatus: (status) => status! < 500, headers: {
  //           "Authorization": "Bearer $access",
  //         }));
  //     setState(() {
  //       categories = categoryModelFromJson(jsonEncode(response.data));
  //       _fetching = false;
  //       //print("token here is ${response.data["access"]}");
  //       print("token here is ${access}");
  //     });
  //     print(response);
  //   } catch (e) {
  //     setState(() {
  //       _fetching = false;
  //     });
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   fetch_categories();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
// if(_fetching){
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
    return  Scaffold(
      body: Center(
        child: _loading ? CircularProgressIndicator(): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${_categoriesModel?.categoryName}")
          ],
        ),
      ),
    );
}
}



