/// success : true
/// message : "Categories found successfully"
/// data : [{"id":1,"category_name":"Web Development","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/web.png"},{"id":2,"category_name":"Graphics","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/graphics.png"},{"id":3,"category_name":"Mobile Development","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/mobile.png"},{"id":4,"category_name":"Networking","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/network.png"},{"id":5,"category_name":"Programming","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/programming.png"},{"id":6,"category_name":"Artificial Intelligence","image_url":"https://be03-196-205-94-85.eu.ngrok.io/assets/ai.png"}]

class CategoryModel {
  CategoryModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CategoryModel.fromJson(dynamic json) {
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