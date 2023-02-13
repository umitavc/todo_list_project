import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_project/app/core/utils/extensions.dart';
import 'package:todo_list_project/app/data/models/task.dart';
import 'package:todo_list_project/app/modules/home/home_controller.dart';
import 'package:todo_list_project/app/modules/home/widgets/add_card.dart';
import 'package:todo_list_project/app/modules/home/widgets/task_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(4.0.wp),
          child: Text(
            "My List",
            style: TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () => GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics:const  ClampingScrollPhysics(),
            children: [
             ...controller.tasks.map((element) => TaskCard(task: element) ).toList(),
              AddCard()],
            ),
        )
      ],
    )));
  }
}
