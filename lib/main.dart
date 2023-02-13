import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_project/app/data/services/storage/services.dart';
import 'package:todo_list_project/app/modules/home/home_binding.dart';
import 'app/modules/home/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
   await GetStorage.init();
   await Get.putAsync(() => StorageServices().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: const  HomeView(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}

