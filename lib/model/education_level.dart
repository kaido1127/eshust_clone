class EducationLevel {
  int? id;
  int? rootId;
  String? code;
  String? name;
  String? fullName;
  String? description;

  EducationLevel({
    this.id,
    this.rootId,
    this.code,
    this.name,
    this.fullName,
    this.description,
  });

  EducationLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rootId = json['rootId'];
    code = json['code'];
    name = json['name'];
    fullName = json['fullName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['rootId'] = rootId;
    data['code'] = code;
    data['name'] = name;
    data['fullName'] = fullName;
    data['description'] = description;
    return data;
  }
}
