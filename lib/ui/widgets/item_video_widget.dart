import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/channel_model.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';

class ItemVideoWidget extends StatefulWidget {
  VideoModel videoModel;

  ItemVideoWidget({required this.videoModel});

  @override
  State<ItemVideoWidget> createState() => _ItemVideoWidgetState();
}

class _ItemVideoWidgetState extends State<ItemVideoWidget> {

  ChannelModel? channelModel;

  bool isLoading = true;

  APIService apiService = APIService();

  getData(){
    apiService.getChannel(widget.videoModel.snippet.channelId).then((value){
      channelModel = value[0];
      isLoading = false;
      setState((){});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: isLoading ? Center(child: CircularProgressIndicator(),):Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.videoModel.snippet.thumbnails.high.url,
                width: double.infinity,
                height: height * 0.3,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  color: Colors.black.withOpacity(0.7),
                  child: Text(
                    "23:22",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0
                    ),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.white12,
              backgroundImage: NetworkImage(
                  channelModel!.snippet.thumbnails.high.url),
              //radius: 15.0,
            ),
            title: Text(
              widget.videoModel.snippet.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 12.5),
            ),
            subtitle: Text(
              "${channelModel!.snippet.title}・6.5 M de vistas・hace 2 años",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white54, fontSize: 11.5),
            ),
            trailing: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
