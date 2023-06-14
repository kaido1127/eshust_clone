import 'package:eshust/apis/apis.dart';
import 'package:eshust/controller/home_controller.dart';
import 'package:eshust/main.dart';
import 'package:eshust/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      //backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          "Thông tin sinh viên",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {
          APIs.getListEducationLevel();
        }, icon: const Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mq.height * 0.17,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_images.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.85)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.3)),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 85,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  homeController.student.value.fullName,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "SĐT: ",
                                      style: TextStyle(color: Colors.black54, fontSize: 13),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        homeController.student.value.phoneNumber,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          fontSize: 13,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Email: ",
                                      style: TextStyle(color: Colors.black54, fontSize: 13),
                                    ),
                                    Text(
                                      homeController.student.value.email,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _shortField('Mã sinh viên:', homeController.student.value.studentId,mq,true),
                          _shortField('Ngày sinh:', homeController.student.value.birthdateStr,mq,true)
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _shortField('Lớp:', homeController.student.value.className,mq,true),
                          _shortField('Số điện thoại:', homeController.student.value.phoneNumber,mq,true)
                        ],
                      ),
                      const SizedBox(height: 15,),
                      _shortField('Khoa viện:', homeController.student.value.schoolName,mq,false),
                      const SizedBox(height: 15,),
                      _shortField('Hệ:', '${homeController.educationLevel} - k${homeController.student.value.studentYear}',mq,false),
                      const SizedBox(height: 15,),
                      _shortField('Email:', homeController.student.value.email,mq,false),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  _shortField(String title,String content,Size mq,bool isShort){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const SizedBox(height: 10,),
        Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10,),
         Container(height: 1,width: isShort?mq.width*0.4:mq.width*0.9,color: Colors.grey[350],)
        //const Divider(height: 1,color: Colors.black87,)
      ],
    );
  }
}
