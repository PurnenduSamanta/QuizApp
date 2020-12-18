import 'package:quiz/Question.dart';
import 'Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question('উটকে মরুভূমির জাহাজ বলা হয়', true),
    Question('রক্তে হিমোগ্লোবিনের কাজ অক্সিজেন পরিবহন করা নয়', false),
    Question('ইউরিয়া সার থেকে উদ্ভিদ নাইট্রোজেন উপাদান গ্রহণ করে', true),
    Question('সুষম খাদ্যের উপাদান ৬ টি', true),
    Question('হাড় ও দাঁতকে মজবুত করে না -ক্যালসিয়াম ও ফসফরাস', false),
    Question('বিশ্ব পরিবেশ দিবস হল – 5ই জুন', true),
    Question(' মিনেমাটা রোগ সৃষ্টিকারী ধাতুটি হল পারদ', true),
    Question('প্রধান গ্রিন হাউস গ্যাসের নাম SO2',false),
    Question('বিশুদ্ধ জলে pH এর মান 7', true),
    Question('পশ্চিমবঙ্গে বাঘ্র প্রকল্প আছে- সুন্দরবনে', true),
    ];

  int  getTotalQuestionNumber()
  {
    return _questions.length;
  }

   void questionNumberCheck()
  {
      _questionNumber++;
  }

  String getQuestion()
  {
    return _questions[_questionNumber].questionText;
  }
  bool getQuestionAnswer()
  {
    return _questions[_questionNumber].questionAnswer;
  }
  bool isFinished()
  {
    if(_questionNumber==_questions.length-1) {
      return true;
    }
    else
      return false;
  }
  void reset()
  {
    _questionNumber=0;
  }

}