import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_project/managers/channels_manager.dart';
import 'package:youtube_project/models/channels_model.dart';
import 'package:youtube_project/network_call/base_response.dart';

class Channels extends StatefulWidget {
  const Channels({ Key? key }) : super(key: key);

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

    final response = await channelsManager.fetchChannels();

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
                    children: [
                      Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 27,
                          //   backgroundImage: NetworkImage("${_channelsModel!.videos![index].profilePic}"),
                          // ),
                          Text("${_channelsModel!.videos![index].categoryId}",
                           style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            " ${_channelsModel!.videos![index].name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}