import 'package:get/get.dart';
import 'package:todo_list_project/app/data/providers/task/provider.dart';
import 'package:todo_list_project/app/data/services/storage/repository.dart';
import 'package:todo_list_project/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }
}
