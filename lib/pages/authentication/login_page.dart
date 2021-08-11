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

//    String pinfield="1234";
//   String email="aparna@ldev.tech";
//   // String enteredotp;
//   // String enteredemails;
//   bool press=false;
//   TextEditingController usernamecontroller = TextEditingController();
//   TextEditingController passwordcontroller=TextEditingController();
//   FocusNode focusNode = FocusNode();
//   final otp= TextEditingController();
//   bool _value = false;

//   dynamic res;
//   void fetchEmail() async {
//     String emails =usernamecontroller.text.trim();
//     String password= passwordcontroller.text.trim();
//     // Map<String,dynamic> data = {
//     //   "email": emails,
//     //
//     // };
//     FormData formData = FormData.fromMap({
//       "username": emails,
//       "password":password

//     });
//     setState(() {
//      // enteredemails=emails;
//     });
//     try {
//       SharedPreferences prefs= await SharedPreferences.getInstance();
//       Object? access = prefs.get("access") ;
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
//         print("token here is ${access}");
//         if(response.statusCode==200){
//           // Fluttertoast.showToast(msg:response.data["message"]);
//           // Navigator.of(context).push(
//           //   MaterialPageRoute(
//           //     builder: (context) => OtpScreen(email: enteredemails,
//           //     ),
//           //   ),
//           // );
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
//     focusNode.dispose();
//     super.dispose();
//   }

//   // TextEditingController usernamecontroller = TextEditingController();
//   // TextEditingController passwordcontroller = TextEditingController();

 
//   // bool _isloading = false;
//   //  SignIn(String username, String password) async {
//   //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   //   Map body = {"username": username, "password": password};
//   //   var jsonResponse;
//   //   var dio = Dio();
//   //   final response = await dio
//   //       .post('http://sowmyamatsa.pythonanywhere.com/api/token/', data: body);

//   //   if (response.statusCode == 200) {
//   //     jsonResponse = json.decode(response.data);
//   //     print("Response Status:{$response.statuscode}");
//   //     print("Response Status:{$response.data}");
//   //     if (jsonResponse != null) {
//   //       setState(() {
//   //         _isloading = false;
//   //       });
//   //       sharedPreferences.setString("token", jsonResponse['token']);
//   //       Navigator.of(context).pushAndRemoveUntil(
//   //           MaterialPageRoute(builder: (BuildContext context) => HomePage()),
//   //           (Route<dynamic> route) => false);
//   //     }
//   //   } else {
//   //     setState(() {
//   //       _isloading = false;
//   //     });
//   //     print("Response Status:{$response.data}");
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Login",
//                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 80,
//               ),
//               TextField(
//                 controller: usernamecontroller,
//                 decoration: InputDecoration(
//                     hintText: "Enter Username",
//                     hintStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.grey,
//                     )),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               TextField(
//                 controller: passwordcontroller,
//                 decoration: InputDecoration(
//                     hintText: "Enter Password",
//                     hintStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.grey,
//                     )),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                    fetchEmail();
//                   },
//                   child: Text(
//                     "Login",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: (){
                 
//                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
//                 },
//                 child: RichText(
//                     text: TextSpan(children: [
//                   TextSpan(
//                       text: 'Dont have an account ?',
//                       style: TextStyle(color: Colors.black, fontSize: 14)),
//                   TextSpan(
//                       text: ' Signup',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14)),
//                 ])),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_project/network_call/base_network.dart';

import 'package:youtube_project/pages/HomePage.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String pinfield="1234";
  // String email="aparna@ldev.tech";
  // String enteredotp;
  // String enteredemails;
  bool press=false;
  TextEditingController newTextEditingController = TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  FocusNode focusNode = FocusNode();
  final otp= TextEditingController();
  bool _value = false;

  dynamic res;
  void fetchEmail() async {
    String emails =newTextEditingController.text.trim();
    String password= passwordcontroller.text.trim();
    // Map<String,dynamic> data = {
    //   "email": emails,
    //
    // };
    FormData formData = FormData.fromMap({
      "username": emails,
      "password":password

    });
    setState(() {
     // enteredemails=emails;
    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String? access = prefs.get("access") as String? ;
      Response response =
      await dioClient.tokenRef.post("http://sowmyamatsa.pythonanywhere.com/api/token/",data: formData,
          options: Options(
              validateStatus: (status) => status! < 500,
              headers: {
                "Authorization":"Bearer $access"
              }
          )
      );

      setState(() {
        res=response.data;
        print("token here is ${response.data["access"]}");
        if(response.statusCode==200){
          // Fluttertoast.showToast(msg:response.data["message"]);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => OtpScreen(email: enteredemails,
          //     ),
          //   ),
          // );
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=> HomePage()),
                  (route) => false
          );

        }
        else{
         Fluttertoast.showToast(msg:response.data["message"]);
        }
      });
      print(response);
    } catch (e) {
      setState(() {
      });
      print(e);
    }
  }

  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:AppColor.backgroungcolor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 150,),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                     // borderRadius:AppColor.borderradius,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2 ),
                    child: TextField(
                      controller: newTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password,size: 20,),
                        hintText: "Email id",
                       // hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      // borderRadius:AppColor.borderradius,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2 ),
                    child: TextField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,size: 20,),
                        hintText: "password",
                        // hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 100,),
                Container(
                  width: 140,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    onPressed: (){
                      fetchEmail();
                      //   if(enteredemails==email){
                      //     setState(() {
                      //       Fluttertoast.showToast(msg:res["message"]);
                      //     });
                      //   }else{
                      //     Fluttertoast.showToast(msg:"");
                      //   }
                      //   setState(() {
                      //     print("Pin is ${enteredotp}");
                      //   });
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(),
                        width: 130,
                        child: Text("SignIn",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20,),),
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}




  