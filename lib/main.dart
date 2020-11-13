import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app_assessment3/androidquiz.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Lets see how well you know Android development',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RussoOne',
                  fontSize: 30.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: Icon(
              Icons.android,
              color: Colors.green[700],
              size: 200.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                elevation: 100.0,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
                },
                child: Text('Start Quiz', textAlign: TextAlign.center,),
                backgroundColor: Colors.blue[900],
                heroTag: "quizButton",
              ),
              FloatingActionButton(
                elevation: 100.0,
                onPressed: ()=> exit(0),
                child: Text('Exit'),
                backgroundColor: Colors.blue[900],
                heroTag: "exitButton",
              ),
            ],
          ),
        ],

      ),
      backgroundColor: Colors.orange[50],
    );

  }

}



