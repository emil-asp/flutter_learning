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
              brightness: Brightness.light,
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
            body: _buildBody()));
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRatings()
                ],
              ),
            )
        ),
        
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        'https://www.periodicocubano.com/wp-content/uploads/2020/06/Se-filtran-fotos-del-rodaje-de-Avatar-2-tras-la-pandemia-en-Nueva-Zelanda.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  DateTime dateTime = DateTime.now();
  String dateString = dateTime.toIso8601String().split('T').first;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Вторник ${dateString}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
      Divider(),
      Text(
        'Это лучшее приложения для показа погоды!!! В облаке папку с зайкой завести куда будем для блога складывать информацию и заведём там документ или общий наш используем где как раз ротмак пропишем',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}


Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(Icons.wb_sunny, color: Colors.yellow,),

        ],
      ),
      SizedBox(width: 16,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('15% Clear', style: TextStyle(color: Colors.deepPurple),)
            ],
          ),
          Row(
            children: [
              Text('Modcow, Mendeleevo', style: TextStyle(color: Colors.grey),)
            ],
          ),
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children:List.generate(8, (int index) {
      return Chip(
        label: Text('${index + 20}%C', style: TextStyle(fontSize: 15),),
        avatar: Icon(Icons.wb_cloudy, color: Colors.blue.shade300,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey)
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.black,),
      Icon(Icons.star, size: 15, color: Colors.black,),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('Info with open weathermap.org', style: TextStyle(fontSize: 16),),
      stars
    ],
  );
}