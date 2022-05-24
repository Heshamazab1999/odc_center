/// success : true
/// message : "Enrolled successfully"
/// data : {"enroll":{"status":"exam_pending","id":5,"student_id":8,"course_id":"8","createdAt":"2022-05-23T23:27:07.593Z"},"revision":{"reviewed":false,"id":5,"student_id":8,"exam_id":4,"student_degree":null,"enroll_id":5,"createdAt":"2022-05-23T23:27:07.595Z"},"userExam":{"exam_taken":false,"expired":false,"id":5,"revision_id":5,"exam_code":5940,"exam_questions":"41, 44, 43, 38, 39, 46, 40, 37, 45, 42","exam_answers":"","eat":"","createdAt":"2022-05-23T23:27:07.597Z"}}

class EnrollModel {
  EnrollModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  EnrollModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// enroll : {"status":"exam_pending","id":5,"student_id":8,"course_id":"8","createdAt":"2022-05-23T23:27:07.593Z"}
/// revision : {"reviewed":false,"id":5,"student_id":8,"exam_id":4,"student_degree":null,"enroll_id":5,"createdAt":"2022-05-23T23:27:07.595Z"}
/// userExam : {"exam_taken":false,"expired":false,"id":5,"revision_id":5,"exam_code":5940,"exam_questions":"41, 44, 43, 38, 39, 46, 40, 37, 45, 42","exam_answers":"","eat":"","createdAt":"2022-05-23T23:27:07.597Z"}

class Data {
  Data({
      Enroll? enroll, 
      Revision? revision, 
      UserExam? userExam,}){
    _enroll = enroll;
    _revision = revision;
    _userExam = userExam;
}

  Data.fromJson(dynamic json) {
    _enroll = json['enroll'] != null ? Enroll.fromJson(json['enroll']) : null;
    _revision = json['revision'] != null ? Revision.fromJson(json['revision']) : null;
    _userExam = json['userExam'] != null ? UserExam.fromJson(json['userExam']) : null;
  }
  Enroll? _enroll;
  Revision? _revision;
  UserExam? _userExam;

  Enroll? get enroll => _enroll;
  Revision? get revision => _revision;
  UserExam? get userExam => _userExam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_enroll != null) {
      map['enroll'] = _enroll?.toJson();
    }
    if (_revision != null) {
      map['revision'] = _revision?.toJson();
    }
    if (_userExam != null) {
      map['userExam'] = _userExam?.toJson();
    }
    return map;
  }

}

/// exam_taken : false
/// expired : false
/// id : 5
/// revision_id : 5
/// exam_code : 5940
/// exam_questions : "41, 44, 43, 38, 39, 46, 40, 37, 45, 42"
/// exam_answers : ""
/// eat : ""
/// createdAt : "2022-05-23T23:27:07.597Z"

class UserExam {
  UserExam({
      bool? examTaken, 
      bool? expired, 
      int? id, 
      int? revisionId, 
      int? examCode, 
      String? examQuestions, 
      String? examAnswers, 
      String? eat, 
      String? createdAt,}){
    _examTaken = examTaken;
    _expired = expired;
    _id = id;
    _revisionId = revisionId;
    _examCode = examCode;
    _examQuestions = examQuestions;
    _examAnswers = examAnswers;
    _eat = eat;
    _createdAt = createdAt;
}

  UserExam.fromJson(dynamic json) {
    _examTaken = json['exam_taken'];
    _expired = json['expired'];
    _id = json['id'];
    _revisionId = json['revision_id'];
    _examCode = json['exam_code'];
    _examQuestions = json['exam_questions'];
    _examAnswers = json['exam_answers'];
    _eat = json['eat'];
    _createdAt = json['createdAt'];
  }
  bool? _examTaken;
  bool? _expired;
  int? _id;
  int? _revisionId;
  int? _examCode;
  String? _examQuestions;
  String? _examAnswers;
  String? _eat;
  String? _createdAt;

  bool? get examTaken => _examTaken;
  bool? get expired => _expired;
  int? get id => _id;
  int? get revisionId => _revisionId;
  int? get examCode => _examCode;
  String? get examQuestions => _examQuestions;
  String? get examAnswers => _examAnswers;
  String? get eat => _eat;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exam_taken'] = _examTaken;
    map['expired'] = _expired;
    map['id'] = _id;
    map['revision_id'] = _revisionId;
    map['exam_code'] = _examCode;
    map['exam_questions'] = _examQuestions;
    map['exam_answers'] = _examAnswers;
    map['eat'] = _eat;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// reviewed : false
/// id : 5
/// student_id : 8
/// exam_id : 4
/// student_degree : null
/// enroll_id : 5
/// createdAt : "2022-05-23T23:27:07.595Z"

class Revision {
  Revision({
      bool? reviewed, 
      int? id, 
      int? studentId, 
      int? examId, 
      dynamic studentDegree, 
      int? enrollId, 
      String? createdAt,}){
    _reviewed = reviewed;
    _id = id;
    _studentId = studentId;
    _examId = examId;
    _studentDegree = studentDegree;
    _enrollId = enrollId;
    _createdAt = createdAt;
}

  Revision.fromJson(dynamic json) {
    _reviewed = json['reviewed'];
    _id = json['id'];
    _studentId = json['student_id'];
    _examId = json['exam_id'];
    _studentDegree = json['student_degree'];
    _enrollId = json['enroll_id'];
    _createdAt = json['createdAt'];
  }
  bool? _reviewed;
  int? _id;
  int? _studentId;
  int? _examId;
  dynamic _studentDegree;
  int? _enrollId;
  String? _createdAt;

  bool? get reviewed => _reviewed;
  int? get id => _id;
  int? get studentId => _studentId;
  int? get examId => _examId;
  dynamic get studentDegree => _studentDegree;
  int? get enrollId => _enrollId;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reviewed'] = _reviewed;
    map['id'] = _id;
    map['student_id'] = _studentId;
    map['exam_id'] = _examId;
    map['student_degree'] = _studentDegree;
    map['enroll_id'] = _enrollId;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// status : "exam_pending"
/// id : 5
/// student_id : 8
/// course_id : "8"
/// createdAt : "2022-05-23T23:27:07.593Z"

class Enroll {
  Enroll({
      String? status, 
      int? id, 
      int? studentId, 
      String? courseId, 
      String? createdAt,}){
    _status = status;
    _id = id;
    _studentId = studentId;
    _courseId = courseId;
    _createdAt = createdAt;
}

  Enroll.fromJson(dynamic json) {
    _status = json['status'];
    _id = json['id'];
    _studentId = json['student_id'];
    _courseId = json['course_id'];
    _createdAt = json['createdAt'];
  }
  String? _status;
  int? _id;
  int? _studentId;
  String? _courseId;
  String? _createdAt;

  String? get status => _status;
  int? get id => _id;
  int? get studentId => _studentId;
  String? get courseId => _courseId;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['id'] = _id;
    map['student_id'] = _studentId;
    map['course_id'] = _courseId;
    map['createdAt'] = _createdAt;
    return map;
  }

}