/// success : true
/// message : "Category found successfully"
/// data : {"id":1,"category_name":"Web Development","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/web.png"}

class CategoryDetailsModel {
  CategoryDetailsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CategoryDetailsModel.fromJson(dynamic json) {
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
/// category_name : "Web Development"
/// image_url : "https://be03-196-205-94-85.eu.ngrok.io/assets/web.png"

class Data {
  Data({
      int? id, 
      String? categoryName, 
      String? imageUrl,}){
    _id = id;
    _categoryName = categoryName;
    _imageUrl = imageUrl;
}

  Data.fromJson(dynamic json) {
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