import 'package:meetups/components/card.dart';
import 'package:meetups/http/web.dart';
import 'package:meetups/models/event.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev meetups'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: getAllEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          List<Widget> children = [];

          if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => CardWidget(
                    imageURL: snapshot.data![index].image,
                    title: snapshot.data![index].title,
                    description: snapshot.data![index].description
                  )
                ),
              )
            ];

          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Erro: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Buscando dados...'),
              )
            ];
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  // getAllEvents
}



