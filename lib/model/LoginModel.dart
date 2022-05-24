/// success : true
/// message : "Login successful"
/// data : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMjUyNjI2LCJleHAiOjE2NTMyNTYyMjZ9.UNssXH6Cgw7NK-nyZya0GRM8Q3tGrr7S91PD-apORDA","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMjUyNjI2LCJleHAiOjE2NTM4NTc0MjZ9.YNdBdtb42Zpv-FmxHgRJDnm3l9BGOGjTbA69EVj7x8k"}

class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
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

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMjUyNjI2LCJleHAiOjE2NTMyNTYyMjZ9.UNssXH6Cgw7NK-nyZya0GRM8Q3tGrr7S91PD-apORDA"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMjUyNjI2LCJleHAiOjE2NTM4NTc0MjZ9.YNdBdtb42Zpv-FmxHgRJDnm3l9BGOGjTbA69EVj7x8k"

class Data {
  Data({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}