/// success : true
/// message : "Register successful"
/// data : {"student":{"id":8,"student_name":"hesham","email":"gwassou6@gmail.com","passwordHash":"$2b$10$JIyPkLyAj4AlJQ1RYpchZu3Ge.Nu92IwozvfZfQhrWgzKn3VmdeF6","student_phone":"01004479160","student_address":"alexandria egypt","updatedAt":"2022-05-22T20:49:55.876Z","createdAt":"2022-05-22T20:49:55.876Z"},"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMjUyNTk1LCJleHAiOjE2NTMyNTYxOTV9.9dnFuocpi__kttBBAVzkpyaByctmGO14b3BU3YlK47s","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMjUyNTk1LCJleHAiOjE2NTM4NTczOTV9.kFXc9VvNEqkUEf22EnKCEkThjPCsOB6-qambc65INck"}

class RegisterModel {
  RegisterModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
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

/// student : {"id":8,"student_name":"hesham","email":"gwassou6@gmail.com","passwordHash":"$2b$10$JIyPkLyAj4AlJQ1RYpchZu3Ge.Nu92IwozvfZfQhrWgzKn3VmdeF6","student_phone":"01004479160","student_address":"alexandria egypt","updatedAt":"2022-05-22T20:49:55.876Z","createdAt":"2022-05-22T20:49:55.876Z"}
/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMjUyNTk1LCJleHAiOjE2NTMyNTYxOTV9.9dnFuocpi__kttBBAVzkpyaByctmGO14b3BU3YlK47s"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMjUyNTk1LCJleHAiOjE2NTM4NTczOTV9.kFXc9VvNEqkUEf22EnKCEkThjPCsOB6-qambc65INck"

class Data {
  Data({
      Student? student, 
      String? accessToken, 
      String? refreshToken,}){
    _student = student;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _student = json['student'] != null ? Student.fromJson(json['student']) : null;
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  Student? _student;
  String? _accessToken;
  String? _refreshToken;

  Student? get student => _student;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_student != null) {
      map['student'] = _student?.toJson();
    }
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}

/// id : 8
/// student_name : "hesham"
/// email : "gwassou6@gmail.com"
/// passwordHash : "$2b$10$JIyPkLyAj4AlJQ1RYpchZu3Ge.Nu92IwozvfZfQhrWgzKn3VmdeF6"
/// student_phone : "01004479160"
/// student_address : "alexandria egypt"
/// updatedAt : "2022-05-22T20:49:55.876Z"
/// createdAt : "2022-05-22T20:49:55.876Z"

class Student {
  Student({
      int? id, 
      String? studentName, 
      String? email, 
      String? passwordHash, 
      String? studentPhone, 
      String? studentAddress, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _studentName = studentName;
    _email = email;
    _passwordHash = passwordHash;
    _studentPhone = studentPhone;
    _studentAddress = studentAddress;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Student.fromJson(dynamic json) {
    _id = json['id'];
    _studentName = json['student_name'];
    _email = json['email'];
    _passwordHash = json['passwordHash'];
    _studentPhone = json['student_phone'];
    _studentAddress = json['student_address'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  String? _studentName;
  String? _email;
  String? _passwordHash;
  String? _studentPhone;
  String? _studentAddress;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  String? get studentName => _studentName;
  String? get email => _email;
  String? get passwordHash => _passwordHash;
  String? get studentPhone => _studentPhone;
  String? get studentAddress => _studentAddress;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['student_name'] = _studentName;
    map['email'] = _email;
    map['passwordHash'] = _passwordHash;
    map['student_phone'] = _studentPhone;
    map['student_address'] = _studentAddress;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    return map;
  }

}