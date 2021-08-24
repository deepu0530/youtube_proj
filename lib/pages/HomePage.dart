// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Column(
//         children: [
//           Text("This IS home Page",
//           style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),),
//     );
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  bool _fetching = true;

  CategoryModel? categories;

  void fetch_categories() async {
    setState(() {
      _fetching = true;
    });
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? access = prefs.get("access") as String?;
      Response response = await dioClient.ref.get("/category/?category_id=1",
          options: Options(validateStatus: (status) => status! < 500, headers: {
            "Authorization": "Bearer $access",
          }));
      setState(() {
        categories = categoryModelFromJson(jsonEncode(response.data));
        _fetching = false;
        //print("token here is ${response.data["access"]}");
        print("token here is ${access}");
      });
      print(response);
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    fetch_categories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
if(_fetching){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: Container(
        child:
        //  categories!.categoryName!.length == null
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : 
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories!.categoryName!.length,
                //itemCount: news!.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  // return Text(categories!.videos[index].name);
                  return Text(categories!.categoryName![index]);
                },
              ),
      ),
    );
  }
  // Widget userdata (){
  //   // if(_fetching){
  //   //   return Center(
  //   //     child: CircularProgressIndicator(),
  //   //   );
  //   // }
  // return   ListView.builder(
  //   physics: NeverScrollableScrollPhysics(),
  //   itemCount: categories!.categoryName.length,
  //   //itemCount: news!.length,
  //   shrinkWrap: true,
  //   scrollDirection: Axis.vertical,
  //   itemBuilder: (context,index){
  //    // return Text(categories!.videos[index].name);
  //     return Text(categories!.categoryName);
  //   },
  // );
  // }
}
