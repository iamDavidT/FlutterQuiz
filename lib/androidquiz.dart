
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int questionNumber = 0;
int score = 0;
var quiz = new AndroidQuiz();

class AndroidQuiz {

  var questions = [
    'Hardware Application Layer provides?',
    'Android Virtual Devices are used to?',
    'Activities are?',
    'What does the manifest do?',
    'What is an interface in Android?',
    'What is a fragment?',
    'Which language is used to define layouts?',
    'What are intents used for?',
    'Which abstract class can be extended to create a database?',
    'Which monetizing mechanism charges users an upfront fee before being able to download the app?'
  ];

  var answers = ['An abstraction layer between the physical device hardware and the remainder of the stack',
    'Simulate the hardware and software configurations of physical devices',
    'Your applications presentation layer',
    'Defines the structure and metadata of the application and its components',
    'Interface acts as a bridge between class and the outside world',
    'Piece of an Activity',
    'XML',
    'As a message passing mechanism',
    'SQLiteOpenHelper',
    'Paid applications'
  ];

  var choices = [
    ['A package for core libraries',
    'An abstraction layer between the physical device hardware and the remainder of the stack',
    'Classes used to create applications', 'Power management'],
    ['Simulate the hardware and software configurations of physical devices',
      'Make phone calls',
      'Manage an applications layout',
      'Play video games'],
    ['An inter application message passing framework',
      'Used to share data across application boundaries',
      'Used to alert users to application events',
      'Your applications presentation layer'],
    ['Stores the strings used in an application',
      'Defines the structure and metadata of the application and its components',
      'Allows you to specify dependencies',
      'Allows other applications to pass data to your application'],
    ['Interface acts as a bridge between class and the outside world',
    'Interface is a class', 'Interface is a layout file', 'None of the above'],
    ['JSON', 'Piece of Activity', 'Layout', 'None of the above'],
    ['JavaScript', 'Kotlin', 'Python', 'XML'],
    ['As a message passing mechanism', 'To help put up a tent', 'To update the gradle file',
      'To select which background color to use'],
    ['CreateDatabase', 'DatabaseHelper', 'SQLiteOpenHelper', 'None of the above'],
    ['In app billing', 'Subscriptions', 'Paid applications', 'Advertising supported']
  ];

}

class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QuizState();
  }

}

class QuizState extends State<Quiz>{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Android Quiz App'),
            centerTitle: true,
            backgroundColor: Colors.blue[700],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(
                  "${quiz.questions[questionNumber]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RussoOne',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                margin: EdgeInsets.all(50.0),
              ),
              MaterialButton(
                color: Colors.green,
                minWidth: 350.0,
                highlightElevation: 100.0,
                onPressed: (){
                  if(quiz.choices[questionNumber][0] == quiz.answers[questionNumber]){
                    debugPrint("correct");
                    score++;
                  }
                  Timer(Duration(milliseconds: 90), (){
                    updateQuestion();
                  });
                },
                child: new Text(
                  quiz.choices[questionNumber][0],
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(15.0),
              ),
              MaterialButton(
                color: Colors.amber,
                minWidth: 350.0,
                highlightElevation: 100.0,
                onPressed: (){
                  if(quiz.choices[questionNumber][1] == quiz.answers[questionNumber]){
                    debugPrint("correct");
                    score++;
                  }
                  Timer(Duration(milliseconds: 90), (){
                    updateQuestion();
                  });
                },
                child: new Text(
                  quiz.choices[questionNumber][1],
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(15.0),
              ),
              MaterialButton(
                color: Colors.red,
                minWidth: 350.0,
                highlightElevation: 100.0,
                onPressed: (){
                  if(quiz.choices[questionNumber][2] == quiz.answers[questionNumber]){
                    debugPrint("correct");
                    score++;
                  }
                  Timer(Duration(milliseconds: 90), (){
                    updateQuestion();
                  });
                },
                child: new Text(
                  quiz.choices[questionNumber][2],
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(15.0),
              ),
              MaterialButton(
                color: Colors.deepPurple,
                minWidth: 350.0,
                highlightElevation: 100.0,
                onPressed: (){
                  if(quiz.choices[questionNumber][3] == quiz.answers[questionNumber]){
                    debugPrint("correct");
                    score++;
                  }
                  Timer(Duration(milliseconds: 90), (){
                    updateQuestion();
                  });
                },
                child: new Text(
                  quiz.choices[questionNumber][3],
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(15.0),
              ),
            ],
          ),
          backgroundColor: Colors.orange[50],
        ),
    );

  }

  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Result(finalScore: score)));
      }
      else{
        questionNumber++;
      }
    });
  }
}

class Result extends StatelessWidget{
  final int finalScore;
  Result({Key k, @required this.finalScore}) : super(key: k);
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text('Thanks for playing'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
        body: Center(
          child: Text(
            'You scored: $finalScore out of 10',
            style: TextStyle(
              fontFamily: 'RussoOne',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       floatingActionButton: FloatingActionButton(
         elevation: 100.0,
         backgroundColor: Colors.blue[900],
         onPressed: (){exit(0);},
         child: Text('Exit'),
       ),
      ),
    );
  }

}
