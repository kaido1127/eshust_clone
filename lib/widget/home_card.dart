import 'package:eshust/main.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title,subtitle_line_1,subtitle_line_2;
  final IconData icon;
  const HomeCard({super.key, required this.title,  required this.icon, required this.subtitle_line_1, required this.subtitle_line_2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mq.width*0.5,
      child: Column(
        children: [
          Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Icon(icon,color: Theme.of(context).iConColor,size: 60,),
            ),
          ),
          const SizedBox(height: 12,),
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 4,),
          Text(subtitle_line_1,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
          Text(subtitle_line_2,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
        ],
      ),
    );
  }
}
