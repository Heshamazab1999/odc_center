/// success : true
/// message : "Course fetched successfully"
/// data : {"id":1,"course_name":"Machine Learning","course_level":"Beginner ","enrollable":1,"entryExamId":1,"exam1":0,"exam2":0,"exam3":0,"finalProject":0,"createdAt":"2022-05-22T13:19:07.000Z","Category":{"id":6,"category_name":"Artificial Intelligence","image_url":"https://5742-196-205-94-85.eu.ngrok.io/assets/ai.png"},"Admin":{"admin_name":"Chosey","email":"bosayousef981@gmail.com"}}

class CoursesDetails {
  CoursesDetails({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CoursesDetails.fromJson(dynamic json) {
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

/// id : 1
/// course_name : "Machine Learning"
/// course_level : "Beginner "
/// enrollable : 1
/// entryExamId : 1
/// exam1 : 0
/// exam2 : 0
/// exam3 : 0
/// finalProject : 0
/// createdAt : "2022-05-22T13:19:07.000Z"
/// Category : {"id":6,"category_name":"Artificial Intelligence","image_url":"https://5742-196-205-94-85.eu.ngrok.io/assets/ai.png"}
/// Admin : {"admin_name":"Chosey","email":"bosayousef981@gmail.com"}

class Data {
  Data({
      int? id, 
      String? courseName, 
      String? courseLevel, 
      int? enrollable, 
      int? entryExamId, 
      int? exam1, 
      int? exam2, 
      int? exam3, 
      int? finalProject, 
      String? createdAt, 
      Category? category, 
      Admin? admin,}){
    _id = id;
    _courseName = courseName;
    _courseLevel = courseLevel;
    _enrollable = enrollable;
    _entryExamId = entryExamId;
    _exam1 = exam1;
    _exam2 = exam2;
    _exam3 = exam3;
    _finalProject = finalProject;
    _createdAt = createdAt;
    _category = category;
    _admin = admin;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _courseName = json['course_name'];
    _courseLevel = json['course_level'];
    _enrollable = json['enrollable'];
    _entryExamId = json['entryExamId'];
    _exam1 = json['exam1'];
    _exam2 = json['exam2'];
    _exam3 = json['exam3'];
    _finalProject = json['finalProject'];
    _createdAt = json['createdAt'];
    _category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
    _admin = json['Admin'] != null ? Admin.fromJson(json['Admin']) : null;
  }
  int? _id;
  String? _courseName;
  String? _courseLevel;
  int? _enrollable;
  int? _entryExamId;
  int? _exam1;
  int? _exam2;
  int? _exam3;
  int? _finalProject;
  String? _createdAt;
  Category? _category;
  Admin? _admin;

  int? get id => _id;
  String? get courseName => _courseName;
  String? get courseLevel => _courseLevel;
  int? get enrollable => _enrollable;
  int? get entryExamId => _entryExamId;
  int? get exam1 => _exam1;
  int? get exam2 => _exam2;
  int? get exam3 => _exam3;
  int? get finalProject => _finalProject;
  String? get createdAt => _createdAt;
  Category? get category => _category;
  Admin? get admin => _admin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['course_name'] = _courseName;
    map['course_level'] = _courseLevel;
    map['enrollable'] = _enrollable;
    map['entryExamId'] = _entryExamId;
    map['exam1'] = _exam1;
    map['exam2'] = _exam2;
    map['exam3'] = _exam3;
    map['finalProject'] = _finalProject;
    map['createdAt'] = _createdAt;
    if (_category != null) {
      map['Category'] = _category?.toJson();
    }
    if (_admin != null) {
      map['Admin'] = _admin?.toJson();
    }
    return map;
  }

}

/// admin_name : "Chosey"
/// email : "bosayousef981@gmail.com"

class Admin {
  Admin({
      String? adminName, 
      String? email,}){
    _adminName = adminName;
    _email = email;
}

  Admin.fromJson(dynamic json) {
    _adminName = json['admin_name'];
    _email = json['email'];
  }
  String? _adminName;
  String? _email;

  String? get adminName => _adminName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin_name'] = _adminName;
    map['email'] = _email;
    return map;
  }

}

/// id : 6
/// category_name : "Artificial Intelligence"
/// image_url : "https://5742-196-205-94-85.eu.ngrok.io/assets/ai.png"

class Category {
  Category({
      int? id, 
      String? categoryName, 
      String? imageUrl,}){
    _id = id;
    _categoryName = categoryName;
    _imageUrl = imageUrl;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _imageUrl = json['image_url'];
  }
  int? _id;
  String? _categoryName;
  String? _imageUrl;

  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['image_url'] = _imageUrl;
    return map;
  }

}