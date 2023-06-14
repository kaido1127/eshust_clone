class Student {
  Student({
    required this.programId,
    required this.id,
    required this.studentId,
    required this.fullName,
    required this.birthdate,
    required this.birthdateStr,
    required this.majorName,
    required this.majorCode,
    required this.studentYear,
    required this.year,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.personalEmail,
    required this.lastLoggedIn,
    required this.status,
    required this.classId,
    required this.lastSemester,
    required this.vaccinated,
    required this.classOrder,
    required this.className,
    required this.schoolName,
    required this.sessionId,
    required this.available,
  });
  late final int programId;
  late final int id;
  late final String studentId;
  late final String fullName;
  late final int birthdate;
  late final String birthdateStr;
  late final String majorName;
  late final String majorCode;
  late final String studentYear;
  late final int year;
  late final int gender;
  late final String phoneNumber;
  late final String email;
  late final String personalEmail;
  late final int lastLoggedIn;
  late final int status;
  late final int classId;
  late final String lastSemester;
  late final int vaccinated;
  late final int classOrder;
  late final String className;
  late final String schoolName;
  late final String sessionId;
  late final bool available;

  Student.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    programId=json['programId']??0;
    studentId = json['studentId']??'';
    fullName = json['fullName']??'';
    birthdate = json['birthdate']??0;
    birthdateStr = json['birthdateStr']??'';
    majorName = json['majorName']??'';
    majorCode = json['majorCode']??'';
    studentYear = json['studentYear']??'';
    year = json['year']??0;
    gender = json['gender']??0;
    phoneNumber = json['phoneNumber']??'';
    email = json['email']??'';
    personalEmail = json['personalEmail']??'';
    lastLoggedIn = json['lastLoggedIn']??0;
    status = json['status']??0;
    classId = json['classId']??0;
    lastSemester = json['lastSemester']??'';
    vaccinated = json['vaccinated']??0;
    classOrder = json['classOrder']??0;
    className = json['className']??'';
    schoolName = json['schoolName']??'';
    sessionId = json['sessionId']??'';
    available = json['available']??true;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['programId']=programId;
    data['id'] = id;
    data['studentId'] = studentId;
    data['fullName'] = fullName;
    data['birthdate'] = birthdate;
    data['birthdateStr'] = birthdateStr;
    data['majorName'] = majorName;
    data['majorCode'] = majorCode;
    data['studentYear'] = studentYear;
    data['year'] = year;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['personalEmail'] = personalEmail;
    data['lastLoggedIn'] = lastLoggedIn;
    data['status'] = status;
    data['classId'] = classId;
    data['lastSemester'] = lastSemester;
    data['vaccinated'] = vaccinated;
    data['classOrder'] = classOrder;
    data['className'] = className;
    data['schoolName'] = schoolName;
    data['sessionId'] = sessionId;
    data['available'] = available;
    return data;
  }
}