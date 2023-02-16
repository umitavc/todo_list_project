import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_list_project/app/core/utils/extensions.dart';
import 'package:todo_list_project/app/data/models/task.dart';
import 'package:todo_list_project/app/modules/home/home_controller.dart';
import 'package:todo_list_project/app/modules/home/widgets/add_card.dart';
import 'package:todo_list_project/app/modules/home/widgets/add_dialog.dart';
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
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...controller.tasks
                        .map((element) => LongPressDraggable(
                            data: element,
                            onDragStarted: () => controller.changeDelete(true),
                            onDraggableCanceled: (_, __) => controller.changeDelete(false),
                            onDragEnd: (_) => controller.changeDelete(false),
                            feedback: Opacity(
                              opacity: 0.8,
                              child: TaskCard(task: element),
                            ),
                            child: TaskCard(task: element)))
                        .toList(),
                    AddCard()
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: DragTarget<Task>(
          builder: (_, __, ___) {
            return Obx(
              () => FloatingActionButton(
                backgroundColor: controller.deleteing.value ? Colors.red : Colors.blue,
                onPressed: () {
                  if (controller.tasks.isNotEmpty) {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  }else{
                    EasyLoading.showInfo('Please create your task type');
                  }
                },
                child: Icon(controller.deleteing.value ? Icons.delete : Icons.add,),
              ),
            );
          },
          onAccept: (Task task) {
            controller.deleteTask(task);
            EasyLoading.showSuccess('Delete Sucess');
          },
        ));
  }
}
