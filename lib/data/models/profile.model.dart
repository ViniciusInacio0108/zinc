import 'dart:convert';

class ProfileModel {
  String? id;
  String? about;
  String? name;
  String? picture_url;
  String? workTitle;
  bool? isCompany;
  String? number;
  String? userId;

  ProfileModel({
    this.id,
    this.about,
    this.name,
    this.picture_url,
    this.workTitle,
    this.isCompany,
    this.number,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'about': about,
      'name': name,
      'picture_url': picture_url,
      'workTitle': workTitle,
      'isCompany': isCompany,
      'number': number,
      'userId': userId,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] != null ? map['id'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      picture_url: map['picture_url'] != null ? map['picture_url'] as String : null,
      workTitle: map['workTitle'] != null ? map['workTitle'] as String : null,
      isCompany: map['isCompany'] != null ? map['isCompany'] as bool : null,
      number: map['number'] != null ? map['number'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProfileModel copyWith({
    String? id,
    String? about,
    String? name,
    String? picture_url,
    String? workTitle,
    bool? isCompany,
    String? number,
    String? userId,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      about: about ?? this.about,
      name: name ?? this.name,
      picture_url: picture_url ?? this.picture_url,
      workTitle: workTitle ?? this.workTitle,
      isCompany: isCompany ?? this.isCompany,
      number: number ?? this.number,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.about == about &&
        other.name == name &&
        other.picture_url == picture_url &&
        other.workTitle == workTitle &&
        other.isCompany == isCompany &&
        other.number == number &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        about.hashCode ^
        name.hashCode ^
        picture_url.hashCode ^
        workTitle.hashCode ^
        isCompany.hashCode ^
        number.hashCode ^
        userId.hashCode;
  }
}
