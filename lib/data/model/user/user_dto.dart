class UserDto {
  UserDto({
    required this.id,
    required this.lastLogin,
    required this.token,
    required this.status,
  });
  late final int id;
  late final String? lastLogin;
  late final String token;
  late final int status;
  late final String username;

  UserDto.fromJson(Map<String, dynamic> json){
    id = json['id'];
    lastLogin = json['last_login'];
    token = json['token'];
    status = json['status'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['last_login'] = lastLogin;
    _data['token'] = token;
    _data['status'] = status;
    _data['username'] = username;
    return _data;
  }
}