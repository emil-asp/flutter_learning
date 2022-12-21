import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(text),
              ),
              ElevatedButton(
                child: Text('Go to second screen', style: TextStyle(fontSize: 24),),
                onPressed: () {
                  _returnDAtaFromSeconsScreen(context);
                },
              )
            ],
          )
      ),
    );
  }

  void _returnDAtaFromSeconsScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SecondScreen());
    final result = await Navigator.push(context, route);

    setState(() {
      text = result;
    });
  }
}