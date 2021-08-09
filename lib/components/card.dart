import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String imageURL;
  String title;
  String description;

  CardWidget({
    required this.imageURL,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(

        children: <Widget>[
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Text(description)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}