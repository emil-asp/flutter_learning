import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: Text('App bar top', style: TextStyle(fontSize: 30, color: Colors.white),),
        ),
        body: Center(
          child: CounterStatefulWidget(

          ),
        ),
      )
    );
  }
}

class CounterStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterStatefulWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tap "-" to decrement', style: TextStyle(color: Colors.white, fontSize: 20),),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 120, height: 50),
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            increment(1);
                          }, icon: Icon(Icons.add)),
                      Text(_count.toString()),
                      IconButton(onPressed: () {
                        increment(-1);
                      }, icon: Icon(Icons.remove)),
                    ],
                  ),
                )
            ),
            Text('Tap "+" to increment', style: TextStyle(color: Colors.white, fontSize: 20),),
          ],
        ),
      );
  }

  void increment(int inc) {
    setState(() {
      _count += inc;
      if (_count > 100) {
        _count = 100;
      }
      if (_count < 0) {
        _count = 0;
      }
    });
  }


}
