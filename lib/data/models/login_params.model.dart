import 'dart:convert';

class LoginParams {
  String email;
  String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) => LoginParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
