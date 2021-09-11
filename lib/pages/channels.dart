import 'dart:convert';
import 'dart:io';



import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_project/managers/channels_manager.dart';
import 'package:youtube_project/models/add_channels_model.dart';
import 'package:youtube_project/models/channels_model.dart';
import 'package:youtube_project/models/patch_channel_model.dart';
import 'package:youtube_project/network_call/base_network.dart';
import 'package:youtube_project/network_call/base_response.dart';

class Channels extends StatefulWidget {
  Channels({this.categid }
  );
 int? categid;
  @override
  _ChannelsState createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {

  bool _loading = true;
  ChannelsModel? _channelsModel;
  Future<void> fetchChannels() async {
    setState(() {
      _loading = true;
    });
    final response = await channelsManager.fetchChannelsManager(widget.categid);

    

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg: response.message);
      setState(() {
        _channelsModel = response.data;
      });
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
      // NavigationService().navigatePage(HomePage());
    } else {
      Fluttertoast.showToast(msg: response.message);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  fetchChannels();
  }



final ImagePicker _picker = ImagePicker();
XFile? image;
void filePicker()async{
  final XFile? selectimage = await _picker.pickImage(source: ImageSource.gallery);
print(selectimage!.path);
setState(() {
  image =selectimage;
});
}

final ImagePicker _picker1 = ImagePicker();
XFile? image1;
void filePicker1()async{
  final XFile? selectimage1 = await _picker.pickImage(source: ImageSource.gallery);
print(selectimage1!.path);
setState(() {
  image1 =selectimage1;
});
}

clearimage(){
  setState(() {
    image=null;
  });
}

clearimage1(){
  setState(() {
    image1=null;
  });
}
  //Add Channel

  AddChannelModel? _addChannelModel;
 dynamic res ;
 final nameController = TextEditingController();
 final descriptionController = TextEditingController();
  final categoryidController = TextEditingController();
  void addcategory()async{
    String text = nameController.text.trim();
     String description = descriptionController.text.trim();
      String categoryid = categoryidController.text.trim();
    FormData data = FormData.fromMap({
      "name":text,
      "description":description,
      "category_id":categoryid,
    });
    Response response = await dioClient.ref.post("/category/",data: data

    );
    setState(() {
      _addChannelModel = addChannelModelFromJson(jsonEncode(response.data));

      print(response.data["message"]);
      res=response.statusMessage;
      print(response);
    });
  }
  _displayAddChannelDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Category'),
            content: Container(
             // height: 100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                   Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter name"
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          child: new Text('Banner'),
                          onPressed: () {
                            
                           filePicker();
                          },
                        ),
                        //  CircleAvatar(
                        //    radius: 25,
                        //    backgroundColor: Colors.lightBlue,
                        //  child: image==null?Text("No Image"):Image.file(File(image!.path)),
                        //  ),
                        SizedBox(width: 30,),
                         IconButton(onPressed: (){
                              clearimage();
                            }, icon: Icon(Icons.close,color: Colors.black,size: 30,)),
                              SizedBox(width: 30,),
                        image==null?Text("No Image"):Image.file(File(image!.path),width: 50,fit: BoxFit.cover,),
                      ],
                    ),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         RaisedButton(
                          child: new Text('Profile Pic'),
                          onPressed: () {
                           filePicker1();
                          
                          },
                    ),
                     SizedBox(width: 30,),
                      IconButton(onPressed: (){
                              clearimage1();
                            }, icon: Icon(Icons.close,color: Colors.black,size: 30,)),
                              SizedBox(width: 30,),
                        image1==null?Text("No Image"):
                        Image.file(File(image1!.path),width: 50,fit: BoxFit.cover,),
                       ],
                     ),
                        SizedBox(height: 10,),
                     Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            hintText: "Description"
                        ),
                      ),
                    ),
                     SizedBox(height: 10,),
                     Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: categoryidController,
                        decoration: InputDecoration(
                            hintText: "Category_id"
                        ),
                      ),
                    ),
                     

                    
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   RaisedButton(
                      child: new Text('Cancel'),
                      onPressed: () {
                       
                        Navigator.of(context).pop(
                          // MaterialPageRoute(
                          //   builder: (context) => HomePage(
                          //   ),
                          //),
                        );
                      },
                    ),
                     RaisedButton(
                      child: new Text('Add'),
                      onPressed: () {
                        addcategory();
                        setState(() {
                          
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Channels(
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Channels", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: _channelsModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                 height: 20,
                ),
                itemCount: _channelsModel!.videos!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.pink,
                            //backgroundImage: NetworkImage("${_channelsModel!.videos![index].profilePic}"),
                          ),
                         
                          SizedBox(width: 10,),
                          Text(
                            " ${_channelsModel!.videos![index].name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                         SizedBox(width: 10,),
                           Text("${_channelsModel!.videos![index].channelId}",
                           style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                               // _patchDialog(context);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: (){
                               // _deletecategory(context);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayAddChannelDialog(context);
         //_displayDialog(context);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
 
}