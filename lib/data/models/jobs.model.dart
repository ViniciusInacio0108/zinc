import 'dart:convert';

class JobsModel {
  String id;
  String created_at;
  String name;
  String description;
  int applicants_quantity;
  int salary;
  bool isAvailable;
  String? jobType;
  String? longitude;
  String? latitude;
  String? companyId;

  JobsModel({
    required this.id,
    required this.created_at,
    required this.name,
    required this.description,
    required this.applicants_quantity,
    required this.salary,
    required this.isAvailable,
    required this.jobType,
    required this.longitude,
    required this.latitude,
    this.companyId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'name': name,
      'description': description,
      'applicants_quantity': applicants_quantity,
      'salary': salary,
      'isAvailable': isAvailable,
      'jobType': jobType,
      'longitude': longitude,
      'latitude': latitude,
      'companyId': companyId,
    };
  }

  factory JobsModel.fromMap(Map<String, dynamic> map) {
    return JobsModel(
      id: map['id'] as String,
      created_at: map['created_at'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      applicants_quantity: map['applicants_quantity'] as int,
      salary: map['salary'] as int,
      isAvailable: map['isAvailable'] as bool,
      jobType: map['jobType'] != null ? map['jobType'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobsModel.fromJson(String source) => JobsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String formatedJobType() {
    switch (jobType) {
      case "full_time":
        return "Tempo integral";
      case "intership":
        return "Estágio";
      case "half_time":
        return "Meio período";
      default:
        return "";
    }
  }
}
