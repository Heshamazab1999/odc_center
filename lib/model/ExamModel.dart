/// success : true
/// message : "Exam fetched successfully"
/// data : [{"id":41,"question":"Which of the following is used to read an HTML page and render it?","question_mark":10,"answer_1":"web server ","answer_2":"web network","answer_3":"web browser","answer_4":"web metrix","correct_answer":"answer_3","exam_id":4},{"id":44,"question":"What is DOM in HTML?","question_mark":10,"answer_1":"Language dependent application programming","answer_2":"Hierarchy of objects in ASP.NET","answer_3":"Application programming interface","answer_4":"Convention for representing and interacting with objects in html documents","correct_answer":"answer_4","exam_id":4},{"id":43,"question":"Which of the following tag is used for inserting the largest heading in HTML?","question_mark":10,"answer_1":"head","answer_2":"h1 tag","answer_3":"h6 tag","answer_4":"heading","correct_answer":"answer_2","exam_id":4},{"id":38,"question":"Who is the father of HTML?","question_mark":10,"answer_1":"Rasmus Lerdorf","answer_2":"Tim Berners-Lee","answer_3":"Brendan Eich","answer_4":"Sergey Brin","correct_answer":"answer_2","exam_id":4},{"id":39,"question":"HTML stands for __________","question_mark":10,"answer_1":" HyperText Markup Language","answer_2":"HyperText Machine Language","answer_3":"HyperText Marking Language","answer_4":"HighText Marking Language","correct_answer":"answer_1","exam_id":4},{"id":46,"question":"Which element is used to get highlighted text in HTML5?","question_mark":10,"answer_1":"u tag","answer_2":"mark tag","answer_3":"highlight tag","answer_4":"b tag","correct_answer":"answer_2","exam_id":4},{"id":40,"question":"What is the correct syntax of doctype in HTML5?","question_mark":10,"answer_1":"/doctype html tag","answer_2":"doctype html tag","answer_3":"doctype html! tag","answer_4":"!doctype html tag","correct_answer":"answer_4","exam_id":4},{"id":37,"question":"What is HTML?","question_mark":10,"answer_1":"HTML describes the structure of a webpage","answer_2":"HTML is the standard markup language mainly used to create web pages","answer_3":"HTML consists of a set of elements that helps the browser how to view the content","answer_4":"All of the mentioned","correct_answer":"answer_4","exam_id":4},{"id":45,"question":"In which part of the HTML metadata is contained?","question_mark":10,"answer_1":"head tag","answer_2":"title tag","answer_3":"html tag","answer_4":"body tag","correct_answer":"answer_1","exam_id":4},{"id":42,"question":"Which of the following is not a difference between HTML and XHTML?","question_mark":10,"answer_1":"Charset in both html and xhtml is “text/html”","answer_2":"Tags and attributes are case-insensitive in HTML but not in XHTML","answer_3":"Special characters must be escaped using character entities in XHTML unlike HTML","answer_4":"Charset in html is “text/html” where as in xhtml it is “application/xml+xhtml”","correct_answer":"answer_1","exam_id":4}]

class ExamModel {
  ExamModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ExamModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 41
/// question : "Which of the following is used to read an HTML page and render it?"
/// question_mark : 10
/// answer_1 : "web server "
/// answer_2 : "web network"
/// answer_3 : "web browser"
/// answer_4 : "web metrix"
/// correct_answer : "answer_3"
/// exam_id : 4

class Data {
  Data({
      int? id, 
      String? question, 
      int? questionMark, 
      String? answer1, 
      String? answer2, 
      String? answer3, 
      String? answer4, 
      String? correctAnswer, 
      int? examId,}){
    _id = id;
    _question = question;
    _questionMark = questionMark;
    _answer1 = answer1;
    _answer2 = answer2;
    _answer3 = answer3;
    _answer4 = answer4;
    _correctAnswer = correctAnswer;
    _examId = examId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _question = json['question'];
    _questionMark = json['question_mark'];
    _answer1 = json['answer_1'];
    _answer2 = json['answer_2'];
    _answer3 = json['answer_3'];
    _answer4 = json['answer_4'];
    _correctAnswer = json['correct_answer'];
    _examId = json['exam_id'];
  }
  int? _id;
  String? _question;
  int? _questionMark;
  String? _answer1;
  String? _answer2;
  String? _answer3;
  String? _answer4;
  String? _correctAnswer;
  int? _examId;

  int? get id => _id;
  String? get question => _question;
  int? get questionMark => _questionMark;
  String? get answer1 => _answer1;
  String? get answer2 => _answer2;
  String? get answer3 => _answer3;
  String? get answer4 => _answer4;
  String? get correctAnswer => _correctAnswer;
  int? get examId => _examId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['question'] = _question;
    map['question_mark'] = _questionMark;
    map['answer_1'] = _answer1;
    map['answer_2'] = _answer2;
    map['answer_3'] = _answer3;
    map['answer_4'] = _answer4;
    map['correct_answer'] = _correctAnswer;
    map['exam_id'] = _examId;
    return map;
  }

}