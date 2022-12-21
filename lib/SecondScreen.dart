import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _SecondScreenState();
}


class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textEditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Scond screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(32),
                  child: TextField(
                    controller: textEditorController,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
              ),
              ElevatedButton(
                child: Text('Go to first screen', style: TextStyle(fontSize: 24), ),
                onPressed: () {
                  String textToSendBack = textEditorController.text;
                  Navigator.pop(context, textToSendBack);
                },
              )
            ],
          )
      ),
    );
  }
  
}