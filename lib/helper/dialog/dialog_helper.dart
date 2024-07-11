import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  // show dialog
  static void showErrorDialog({String? title = "Error", String? description = 'Something went wrong'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            title ?? '',
            style: Get.textTheme.headlineMedium,
          ),
          Text(
            description ?? '',
            style: Get.textTheme.titleLarge,
          ),
          ElevatedButton(
              onPressed: () {
                if (Get.isDialogOpen!) Get.back();
              },
              child: const Text('OK'))
        ]),
      ),
    ));
  }
  // show toast

  // show loading
  static void showLoadingDialog([String? message]) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 8,
          ),
          Text(message ?? 'Loading...')
        ]),
      ),
    ));
  }
  // hide loading

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) Get.back();
  }
}
