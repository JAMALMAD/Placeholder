import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B37EA),
        centerTitle: true,
        title: const Text(
          "SMT Task",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }
        if (homeController.dataList.isEmpty) {
          return const Center(
            child: Text("No data available", style: TextStyle(fontSize: 18)),
          );
        }
        return ListView.builder(
          itemCount: homeController.dataList.length,
          itemBuilder: (context, index) {
            final data = homeController.dataList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(data.id.toString()),
                ),
                title: Text("User ID: ${data.userId}"),
                subtitle: Text("Title: ${data.title ?? "No Title"}"),
              ),
            );
          },
        );
      }),
    );
  }
}
