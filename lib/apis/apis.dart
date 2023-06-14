import 'dart:convert';
import 'dart:developer';

import 'package:eshust/data/link.dart';
import 'package:eshust/helper/my_dialogs.dart';
import 'package:eshust/model/education_level.dart';
import 'package:eshust/model/student.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class APIs{
  static Future<void> getStudentInfo({required Rx<Student> student}) async{
    try {
      final res=await get(Uri.parse(Link.info));
      log(res.body);
      student.value=Student.fromJson(jsonDecode(res.body)['data']);
    } on Exception catch (e) {
      MyDialogs.error(msg: e.toString());
    }
  }

  static Future<List<EducationLevel>> getListEducationLevel() async{
    final List<EducationLevel> list=[];
    try {
      final res=await get(Uri.parse(Link.educationLevel));
      final listJson=jsonDecode(res.body)['data'];
      for(var json in listJson){
        list.add(EducationLevel.fromJson(json));
      }
    } on Exception catch (e) {
      MyDialogs.error(msg: e.toString());
    }
    return list;
  }

}