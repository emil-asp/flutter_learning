import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather',
          style: TextStyle(fontSize: 30, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => {},
          ),
        ],
      ),
      body: BodyListView(),
    ));
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (int i) => i % 6 == 0
          ? HeadingItem('Heading ${i}')
          : MessageItem('Sender ${i}', 'Message body $i'));

  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(item.heading, style: Theme.of(context).textTheme.headline4,),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
            leading: Icon(Icons.insert_photo, color: Colors.red),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          );
        } else {
          return ListTile();
        }
      });
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
