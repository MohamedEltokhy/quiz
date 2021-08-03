import 'dart:ui';

import 'package:flutter/material.dart';


import 'questionsGroup.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuestionGroup qGroup =QuestionGroup();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "اختبر نفسك",
          ),
          backgroundColor: Colors.grey,
        ),
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> answerResult = [];

  void checkAnswers(bool whatUserPicked){
    bool correctAnswer = qGroup.getQuestionAnswer();
    setState(() {
    if(whatUserPicked == correctAnswer){
      answerResult.add(
        Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.indigo,
          ),
        ),
      );
    }else{
      answerResult.add(
        Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.deepOrange,
          ),
        ),
      );
    }
    if(qGroup.isFinished() == true){

      Alert(
        context: context,
        title: "انتهاء الاختبار",
        desc: "لقد اجبت علي كل الاسئلة",
        buttons: [
          DialogButton(
            child: Text(
              "اعادة المحاولة",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      qGroup.reset();
      answerResult = [];

    }else{
      qGroup.nextQuestion();
    }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(qGroup.getQuestionImage()),
              SizedBox(
                height: 10.0,
              ),
              Text(
                qGroup.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black
                ),
              )
            ]
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              color: Colors.indigo,
              child: Text(
                "صح",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswers(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              color: Colors.deepOrange,
              child: Text(
                "خطأ",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswers(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
