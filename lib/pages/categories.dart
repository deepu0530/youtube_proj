import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_project/managers/categories_manager.dart';
import 'package:youtube_project/models/add_category.dart';

import 'package:youtube_project/models/categories.dart';
import 'package:youtube_project/models/delete_category.dart';
import 'package:youtube_project/models/patch_category_model.dart';
import 'package:youtube_project/network_call/base_network.dart';
import 'package:youtube_project/network_call/base_response.dart';
import 'package:youtube_project/pages/channels.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

// This code for get categories data

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
      Fluttertoast.showToast(msg: response.message);
      setState(() {
        _categoriesModel = response.data;
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
    fetchCategories();
  }

// This code for add categories 

AddCategoryModel? _addCategoryModel;
 dynamic res ;
 final nameController = TextEditingController();

  void addcategory()async{
    String text = nameController.text.trim();
    FormData data = FormData.fromMap({
      "name":text,
    });
    Response response = await dioClient.ref.post("/category/",data: data

    );
    setState(() {
      _addCategoryModel = addCategoryModelFromJson(jsonEncode(response.data));

      print(response.data["message"]);
      res=response.statusMessage;
      print(response);
    });
  }
  _displayDialog(BuildContext context) async {
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

                    // RaisedButton(
                    //     child: Text("Submit"),
                    //     onPressed: (){
                    //       addcategory();
                    //       setState(() {

                    //       });
                    //     }),
                   // res == null ? Text("")  : Text("test --- ${res}"),
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
                            builder: (context) => Categories(
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
// This Code for patch category

PatchCategoryModel? _patchCategoryModel;
 dynamic patchCategoryResponse ;
 final categoryIdcontoller = TextEditingController();
   void patchcategory()async{
    String  text = nameController.text.trim();
    String categoryid = categoryIdcontoller.text.trim();

    try{
      FormData formData = FormData.fromMap({
        "category_id":categoryid,
        "name" : text,

      });
      Response response = await dioClient.ref.patch("/category/",data: formData

      );
      setState(() {
        _patchCategoryModel = patchCategoryModelFromJson(jsonEncode(response.data));

        print(response.data);
        patchCategoryResponse=response.data["message"];
      });
    }
    catch(e){

    }
  }
  _patchDialog(BuildContext context) async  {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Patch Category'),
            content: Container(
              //height: 150,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: categoryIdcontoller,
                        decoration: InputDecoration(
                            hintText: "Enter category id"
                        ),
                      ),
                    ),
                    Container(
                     // padding: EdgeInsets.symmetric(horizontal: 0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter Category Name"
                        ),
                      ),
                    ),
                    // RaisedButton(
                    //     child: Text("click to update"),
                    //     onPressed: (){
                    //       patchcategory();
                    //       setState(() {

                    //       });
                    //     }),
                    // patchresponse==null?Text("enter valid id"):Text(patchresponse),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                  child: new Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(
                      // MaterialPageRoute(
                      //   builder: (context) => HomePage(
                      //   ),
                      // ),
                    );
                  },
                ),
                     RaisedButton(
                  child: new Text('Update'),
                  onPressed: () {
                    patchcategory();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Categories(
                        ),
                      ),
                    );
                  },
                )
                  ],
                ),
              )
            ],
          );
        });
  }

//This code for delete category

DeleteCategoryModel? _deleteCategoryModel;
 dynamic responseFordeleteCategory ;

 final catidcontroller = TextEditingController();

  void deletecategory() async {
    String  number = catidcontroller.text.trim();
    try {
      FormData formData = FormData.fromMap({
        "category_id" :number
      });
      Response response = await dioClient.ref.delete("/category/",data: formData

      );
      setState(() {
         _deleteCategoryModel= deleteCategoryModelFromJson(jsonEncode(response.data));
        print(response.data["message"]);
        responseFordeleteCategory=response.data["message"];
      });
    } catch (e) {
      setState(() {
        print("error ---> $e");
      });
      print(e);
    }
  }
  _deletecategory(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Category'),
            content: Container(
              //height: 150,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: catidcontroller,
                        decoration: InputDecoration(
                            hintText: "Enter id "
                        ),
                      ),
                    ),
                   
                   
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20,bottom: 20 ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                  child: new Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(
                      // MaterialPageRoute(
                      //   builder: (context) => HomePage(
                      //   ),
                      // ),
                    );
                  },
                ),
                    RaisedButton(
                  child: new Text('Delete'),
                  onPressed: () {
                    setState(() {
                      
                    });
                    deletecategory();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Categories(
                        ),
                      ),
                    );
                  },
                ),
                  ],
                ),
              ),
               //responseFordeleteCategory == null ?Text("enter valid id") :Text("category --- ${res}"),
              // respo == null ?Text("enter valid id") :Text("test --- ${respo}"),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: GestureDetector(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(Icons.logout)),
        title: Text("Categories", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: 
        _categoriesModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                itemCount: _categoriesModel!.videos!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("${_categoriesModel!.videos![index].categoryId}",
                           style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            " ${_categoriesModel!.videos![index].name}",
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
                              _patchDialog(context);
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
                              _deletecategory(context);
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
         _displayDialog(context);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
