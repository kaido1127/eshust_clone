import 'package:eshust/apis/apis.dart';
import 'package:eshust/controller/home_controller.dart';
import 'package:eshust/data/link.dart';
import 'package:eshust/main.dart';
import 'package:eshust/screen/profile_screen.dart';
import 'package:eshust/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {

    _controller.getStudent();
    return Scaffold(
      //backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Image.asset(
            'assets/images/hust_logo.png',
          ),
        ),
        title: const Text(
          "EsHUST",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ProfileScreen());
              },
              icon:  CircleAvatar(backgroundColor: Colors.grey[350], child: const Icon(Icons.person,color: Colors.white,))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: InkWell(
                onTap: () {
                  Get.to(const ProfileScreen());
                  //APIs.getStudentInfo();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle_sharp,
                    size: 50,
                    color: Colors.grey[350],
                  ),
                  title: Row(
                    children: [
                      Text(
                        _controller.student.value.fullName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '| ${_controller.student.value.studentId}',
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  subtitle:  Text(
                    _controller.student.value.majorName,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Theme.of(context).iConColor,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Thời khóa biểu',
                  subtitle_line_1: 'Tra cứu thời khóa biểu, ',
                  icon: Icons.calendar_month_outlined,
                  subtitle_line_2: 'lịch thi',
                ),
                HomeCard(
                  title: 'Đồ án',
                  subtitle_line_1: 'Thông tin các đồ án',
                  icon: Icons.work_history_outlined,
                  subtitle_line_2: '',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Thông báo tin tức',
                  subtitle_line_1: 'Các thông báo quan',
                  icon: Icons.newspaper,
                  subtitle_line_2: 'trọng',
                ),
                HomeCard(
                  title: 'Kết quả học tập',
                  subtitle_line_1: 'Thông tin kết quả',
                  icon: Icons.check,
                  subtitle_line_2: 'học tập',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Lớp sinh viên',
                  subtitle_line_1: 'Thông tin lớp của',
                  icon: Icons.groups,
                  subtitle_line_2: 'sinh viên',
                ),
                HomeCard(
                  title: 'Tiện ích',
                  subtitle_line_1: 'Sổ tay sinh viên, bản đồ',
                  icon: Icons.extension_outlined,
                  subtitle_line_2: '',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  title: 'Biểu mẫu online',
                  subtitle_line_1: 'Bảng điểm, chứng nhân',
                  icon: Icons.edit_document,
                  subtitle_line_2: 'sv, giấy giới thiệu',
                ),
                HomeCard(
                  title: 'Học phí',
                  subtitle_line_1: 'Thông tin chi tiết',
                  icon: Icons.monetization_on_outlined,
                  subtitle_line_2: 'về học phí',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),)
    );
  }
}
