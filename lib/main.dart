import 'package:flutter/material.dart';
import 'package:quiz/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
            ),
          ),
        ),
      );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeperList=[];
  QuizBrain quizBrain=QuizBrain();
  int alert=0;
  int score=0;
  void checkAnswer(bool userPickedAnswer)
  {
      setState(() {
        if (quizBrain.getQuestionAnswer() == userPickedAnswer) {
          scoreKeeperList.add(Icon(Icons.check, color: Colors.green,));
          if(alert!=1)
          score++;
        }
        else {
          scoreKeeperList.add(Icon(Icons.close, color: Colors.red,));
        }
        if(quizBrain.isFinished())
          {
          alert++;
          }
        else
        quizBrain.questionNumberCheck();
        if(alert==2)
          {
            alert=0;
            int totalQuestions= quizBrain.getTotalQuestionNumber();
            Alert(
              context: context,
              title: 'You\'ve reached the end of the quiz.',
              desc: 'Your score is $score out of $totalQuestions',
            ).show();
            score=0;
            scoreKeeperList=[];
            quizBrain.reset();
          }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget> [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(quizBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              onPressed: ()
              {
               checkAnswer(true);
              },
              child: Text('সত্যি ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(onPressed: (){
            checkAnswer(false);
            },
              color: Colors.red,
              child: Text('মিথ্যা ',
                style: TextStyle(color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeperList,
        ),
      ],
    );
  }
}
