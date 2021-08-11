import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


TextEditingController usernameController=TextEditingController();

TextEditingController passwordController=TextEditingController();

TextEditingController confirmpasswordController=TextEditingController();

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