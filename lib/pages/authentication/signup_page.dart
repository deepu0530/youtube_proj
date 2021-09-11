import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_project/managers/auth_manager.dart';
import 'package:youtube_project/network_call/base_response.dart';

import 'package:youtube_project/pages/authentication/login_page.dart';
import 'package:youtube_project/pages/categories.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool _loading = false;
  Future<void> performSignup() async {
    String name = usernameController.text.trim();
    String pass = passwordController.text.trim();
    String rePass = confirmpasswordController.text.trim();
    if (name.isEmpty || pass.isEmpty|| rePass.isEmpty) {

      Fluttertoast.showToast( msg:"enter details");
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _loading = true;
    });

    final response = await authManager.PreformRegister(name , pass , rePass);
    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg:response.message);
     
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg:response.message);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categories()));
    }
  }
// TextEditingController usernameController=TextEditingController();

// TextEditingController passwordController=TextEditingController();

// TextEditingController confirmpasswordController=TextEditingController();

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
                "SignUp",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Username",
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
                    hintText: "Password",
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
                controller: confirmpasswordController,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                   performSignup();
                   
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginPage(
                    //     ),
                    //   ),
                    // );
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                   Navigator.pop(context 
                  
                   );
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Already have an account ?',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  TextSpan(
                      text: ' SignIn',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}


