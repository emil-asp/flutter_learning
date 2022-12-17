import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: Colors.red),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: BuildBody(),
        ));
  }
}

Widget BuildBody() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _inputComponent(),
          _cityDetail('Moscow, Center'),
          _temperatureDetail(27, 'Очень солнечно'),
          _extraWeatherDetail(),
          Text(
            '7-Day weather forecast'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          WeatherForecastListView()
        ],
      ),
    ),
  );
}

// Form
// City detail
// Temerature detail
// Extra weather detail
// Text
// BottomDetailView

class ExtraWeatherDetailItemWidget extends StatelessWidget {
  final IconData iconData;
  final int value;
  final String metric;

  ExtraWeatherDetailItemWidget(this.iconData, this.value, this.metric);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.iconData,
          color: Colors.white,
          size: 30,
        ),
        Text(
          this.value.toString(),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Text(
          this.metric,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}

Widget _extraWeatherDetail() {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ExtraWeatherDetailItemWidget(Icons.ac_unit, 5, 'km/hr'),
        ),
        Expanded(
          flex: 1,
          child: ExtraWeatherDetailItemWidget(Icons.ac_unit, 3, '%'),
        ),
        Expanded(
          flex: 1,
          child: ExtraWeatherDetailItemWidget(Icons.ac_unit, 20, '%'),
        ),
      ],
    ),
  );
}

Widget _temperatureDetail(int temperature, String comment) {
  return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 80,
            ),
            Column(
              children: [
                Text(
                  '${temperature.toString()} F',
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
                Text(
                  comment,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            )
          ],
        ),
      ));
}

Widget _cityDetail(String city) {
  var date = DateTime.now();
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      children: [
        Text(
          city,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          date.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
  );
}

class _inputComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        Expanded(
            child: TextField(
          onChanged: (String) => {print('Text change')},
          decoration: InputDecoration(
              hintText: 'Enter city name',
              hintStyle: TextStyle(color: Colors.white)),
        ))
      ],
    );
  }
}

Widget listViewItem(WeatherForecastDayItem item) {
  return Container(
    color: Colors.white30,
    margin: EdgeInsets.only(right: 10),
    width: 160,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 20),
          child: Text(
            item.day,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('${item.temperature.toString()} F',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            Icon(
              item.iconData,
              color: Colors.white,
              size: 40,
            )
          ],
        )
      ],
    ),
  );
}

class WeatherForecastDayItem {
  final String day;
  final int temperature;
  final IconData iconData;

  WeatherForecastDayItem(this.day, this.temperature, this.iconData);
}

class WeatherForecastListView extends StatelessWidget {
  final List<WeatherForecastDayItem> items = [
    new WeatherForecastDayItem('Понедельник', 32, Icons.wb_sunny),
    new WeatherForecastDayItem('Вторник', 30, Icons.wb_sunny),
    new WeatherForecastDayItem('Среда', 27, Icons.wb_sunny),
    new WeatherForecastDayItem('Четверг', 30, Icons.wb_sunny),
    new WeatherForecastDayItem('Пятница', 29, Icons.wb_sunny),
    new WeatherForecastDayItem('Суббота', 28, Icons.wb_sunny),
    new WeatherForecastDayItem('Воскресенье', 31, Icons.wb_sunny),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          WeatherForecastDayItem item = items[index];
          return listViewItem(item);
        },
      ),
    );
  }
}