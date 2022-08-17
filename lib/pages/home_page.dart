import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIService apiService = APIService();
  List<VideoModel> videos = [];

  getData() {
    apiService.getVideo().then((value) {
      videos = value;
      setState(() {});
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 0,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kBrandSecondaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 10.0)),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.explore_outlined,
                    ),
                    label: const Text(
                      "Explorar",
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                    child: VerticalDivider(
                      color: Colors.white30,
                      thickness: 1.0,
                    ),
                  ),
                  ItemFilterWidget(
                    text: "Todos",
                    isSelected: true,
                  ),
                  ItemFilterWidget(
                    text: "Mixes",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Musica",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Programacion",
                    isSelected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemVideoWidget(videoModel: videos[index],);
              },
            ),
          ],
        ),
      ),
    );
  }
}
