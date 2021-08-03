import 'questions.dart';

class QuestionGroup{

  int _questionsNumber = 0;

  List<Question> _questionGroup =[
    Question(
        questionsText: "عدد كواكب المجموعة الشمسية هي ثمانية كواكب",
        questionImages: "images/image-1.jpg",
        answers: true
    ),
    Question(
        questionsText: "القطط هي حيوانات لاحمة",
        questionImages: "images/image-2.jpg",
        answers: true
    ),
    Question(
        questionsText: "الصين موجودة في القارة الافريقيا",
        questionImages: "images/image-3.jpg",
        answers:false
    ),
    Question(
        questionsText: "الارض مسطحة وليست كروية",
        questionImages: "images/image-4.jpg",
        answers: false
    ),
    Question(
        questionsText: "باستطاع الانسان البقاء علي قيد الحياة بدون اكل لحوم",
        questionImages: "images/image-5.jpg",
        answers: true
    ),
    Question(
        questionsText: "الشمس تدور حول الارض والارض تدور حول القمر",
        questionImages: "images/image-6.jpg",
        answers: false
    ),
    Question(
        questionsText: "الحيوانات لاتشعر بالام",
        questionImages: "images/image-7.jpg",
        answers: false
    ),
  ];

  void nextQuestion(){
    if(_questionsNumber < _questionGroup.length - 1) {
      _questionsNumber++;
    }
  }


  String getQuestionText(){
    return _questionGroup[_questionsNumber].questionsText;
  }

  String getQuestionImage(){
    return _questionGroup[_questionsNumber].questionImages;
  }

  bool getQuestionAnswer(){
    return _questionGroup[_questionsNumber].answers;
  }

  bool isFinished(){
    if(_questionsNumber >= _questionGroup.length -1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionsNumber = 0;
  }
}