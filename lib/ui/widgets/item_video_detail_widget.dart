import 'package:flutter/material.dart';

class ItemVideoDetailWidget extends StatelessWidget {
  String texto;
  IconData icon;

  ItemVideoDetailWidget({
    required this.texto,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 26.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            texto,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
