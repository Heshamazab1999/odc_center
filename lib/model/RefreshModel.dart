/// success : true
/// message : "Token refreshed"
/// data : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMzQ1NDk5LCJleHAiOjE2NTMzNDkwOTl9.iklIqziYo9eDKtD6JUiGhiXvyKe53ok7YBiYtMQkjBA","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMzQ1NDk5LCJleHAiOjE2NTM5NTAyOTl9.yjsHzrWvXuXERUzuDwE9APzdA7w2Roq7Z4kUBsEkVKM"}

class RefreshModel {
  RefreshModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  RefreshModel.fromJson(dynamic json) {
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

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjUzMzQ1NDk5LCJleHAiOjE2NTMzNDkwOTl9.iklIqziYo9eDKtD6JUiGhiXvyKe53ok7YBiYtMQkjBA"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwicmVmcmVzaCI6dHJ1ZSwiaWF0IjoxNjUzMzQ1NDk5LCJleHAiOjE2NTM5NTAyOTl9.yjsHzrWvXuXERUzuDwE9APzdA7w2Roq7Z4kUBsEkVKM"

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