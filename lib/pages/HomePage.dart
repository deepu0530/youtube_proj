import 'package:flutter/material.dart';
import 'package:youtube_project/pages/authentication/login_page.dart';
import 'package:youtube_project/pages/categories.dart';
import 'package:youtube_project/pages/channels.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: RaisedButton(
                  child: new Text('Categories'),
                  onPressed: () {
                  
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Categories(
                        ),
                      ),
                    );
                  },
                )),
                SizedBox(height: 30,),
                //  Center(child: RaisedButton(
                //   child: new Text('Channels'),
                //   onPressed: () {
                   
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => Channels(
                         
                //         ),
                //       ),
                //     );
                //   },
                // ))
        ],
      ),),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                        ),
                      ),
          );
          // Add your onPressed code here!
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}