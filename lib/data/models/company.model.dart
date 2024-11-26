import 'dart:convert';

class CompanyModel {
  String id;
  String created_at;
  String name;
  String description;

  CompanyModel({
    required this.id,
    required this.created_at,
    required this.name,
    required this.description,
  });

  factory CompanyModel.empty() => CompanyModel(id: "", created_at: "", name: "", description: "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'name': name,
      'description': description,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String,
      created_at: map['created_at'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
