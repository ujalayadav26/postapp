import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  int id;
  String title;
  String body;
  int userId;
  List<String> tags;
  int reaction;
  CustomWidget({
    super.key,
    required this.id,
    required this.title,
    required this.body,
    required this.reaction,
    required this.tags,
    required this.userId,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Text(
                  "By ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "${id}",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                      color: Colors.orange),
                    ),
                  ),
                  Text(
                    "${title}",
                    style: TextStyle(fontSize: 10, color: Colors.orange),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${body}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              " ${userId} ",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${tags}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${reaction}"),
          )
        ],
      ),
    );
  }
}