import 'package:define_todo_app/features/overview_page/model/overview_model.dart';
import 'package:define_todo_app/features/overview_page/services/overview_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewController extends GetxController {
  final OverviewService _todoService = OverviewService();
  final TextEditingController taskController = TextEditingController();

  void clearFields() {
    taskController.clear();
  }

  var detail = <OverviewModel>[].obs;
  var taskLengths = <String, int>{}.obs;

  void fetchDetails(String userId, String todoId) {
    _todoService.getDetails(userId, todoId).listen((detailsList) {
      detail.value = detailsList;
      taskLengths[todoId] = detailsList.length;
    }, onError: (error) {
      Get.snackbar("Error", "failed to get data $error");
    });
  }

  Future<void> addDetails(String userId, String todoId, String task) async {
    try {
      final details = OverviewModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        task: task,
        createdAt: DateTime.now(),
      );
      await _todoService.addDetail(userId, todoId, details);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add comment: $e');
    }
  }
}
