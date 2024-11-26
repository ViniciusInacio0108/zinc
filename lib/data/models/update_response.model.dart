import 'dart:convert';

class UpdateResponseModel {
  int? status;
  String? statusText;

  UpdateResponseModel({
    this.status,
    this.statusText,
  });

  UpdateResponseModel copyWith({
    int? status,
    String? statusText,
  }) {
    return UpdateResponseModel(
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'statusText': statusText,
    };
  }

  factory UpdateResponseModel.fromMap(Map<String, dynamic> map) {
    return UpdateResponseModel(
      status: map['status'] != null ? map['status'] as int : null,
      statusText: map['statusText'] != null ? map['statusText'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateResponseModel.fromJson(String source) =>
      UpdateResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateResponseModel(status: $status, statusText: $statusText)';

  @override
  bool operator ==(covariant UpdateResponseModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.statusText == statusText;
  }

  @override
  int get hashCode => status.hashCode ^ statusText.hashCode;
}
