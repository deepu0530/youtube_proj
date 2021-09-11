// import 'dart:convert';
// import 'dart:core';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:youtube_project/network_call/base_network.dart';
// import 'package:youtube_project/pages/HomePage.dart';
// import 'package:youtube_project/pages/authentication/signup_page.dart';
// import 'package:youtube_project/utils/storage_keys.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//    bool press=false;
//   TextEditingController usernamecontroller = TextEditingController();
//   TextEditingController passwordcontroller=TextEditingController();

//   bool _value = false;

//   dynamic res;
//   void performlogin() async {
//     String emails =usernamecontroller.text.trim();
//     String password= passwordcontroller.text.trim();
    
//     FormData formData = FormData.fromMap({
//       "username": emails,
//       "password":password

//     });
//     setState(() {
//      // enteredemails=emails;
//     });
//     try {
//       SharedPreferences prefs= await SharedPreferences.getInstance();
//       String? access = prefs.get("access") as String? ;
//       Response response =
//       await dioClient.tokenRef.post("http://sowmyamatsa.pythonanywhere.com/api/token/",data: formData,
//           options: Options(
//               validateStatus: (status) => status! < 500,
//               headers: {
//                 "Authorization":"Bearer $access"
//               }
//           )
//       );

//       setState(() {
//         res=response.data;
//         print("token here is ${response.data["access"]}");
//         if(response.statusCode==200){
         
//           Navigator.pushAndRemoveUntil(context,
//               MaterialPageRoute(builder: (context)=> HomePage()),
//                   (route) => false
//           );

//         }
//         else{
//          Fluttertoast.showToast(msg:response.data["message"]);
//         }
//       });
//       print(response);
//     } catch (e) {
//       setState(() {
//       });
//       print(e);
//     }
//   }

//   @override
//   void dispose() {
//     usernamecontroller.dispose();

//     super.dispose();
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 20, right: 20),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           "Login",
      //           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(
      //           height: 80,
      //         ),
      //         TextField(
      //           controller: usernamecontroller,
      //           decoration: InputDecoration(
      //               hintText: "Enter Username",
      //               hintStyle: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //                 color: Colors.grey,
      //               )),
      //         ),
      //         SizedBox(
      //           height: 40,
      //         ),
      //         TextField(
      //           controller: passwordcontroller,
      //           decoration: InputDecoration(
      //               hintText: "Enter Password",
      //               hintStyle: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //                 color: Colors.grey,
      //               )),
      //         ),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //              performlogin();
      //             },
      //             child: Text(
      //               "Login",
      //               style: TextStyle(color: Colors.white, fontSize: 20),
      //             )),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         GestureDetector(
      //           onTap: (){
                 
      //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
      //           },
      //           child: RichText(
      //               text: TextSpan(children: [
      //             TextSpan(
      //                 text: 'Dont have an account ?',
      //                 style: TextStyle(color: Colors.black, fontSize: 14)),
      //             TextSpan(
      //                 text: ' Signup',
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 14)),
      //           ])),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_project/managers/auth_manager.dart';
import 'package:youtube_project/network_call/base_response.dart';

import 'package:youtube_project/pages/authentication/signup_page.dart';
import 'package:youtube_project/pages/categories.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController() ;
  final passwordController = TextEditingController();
  bool _loading = false;
  Future<void> performLogin() async {
    String name = usernameController.text.trim();
    String pass = passwordController.text.trim();
    if (name.isEmpty || pass.isEmpty) {
      Fluttertoast.showToast( msg:"enter details");
      return;
    }

    setState(() {
      _loading = true;
    });

    final response = await authManager.PerformLogin(name , pass);

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg:response.message);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categories()));
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg:response.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Enter Username",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                 performLogin();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                 
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Dont have an account ?',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  TextSpan(
                      text: '  Signup',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

