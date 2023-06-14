import 'package:eshust/apis/apis.dart';
import 'package:eshust/model/education_level.dart';
import 'package:eshust/model/student.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
   String educationLevel='';
   final Rx<Student> student =Student.fromJson({}).obs;
   List<EducationLevel> listEducationLevel=[];

   Future<void> getStudent() async{
      await APIs.getStudentInfo(student: student);
      listEducationLevel= await APIs.getListEducationLevel();
      educationLevel=listEducationLevel.where((element) => element.id==student.value.programId).first.fullName??'';
   }

}