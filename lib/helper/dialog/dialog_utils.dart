import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';
import 'package:flutter/cupertino.dart';

showLoadingDialog() {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.grey.withOpacity(0.3),
    useSafeArea: false,
    context: navigatorKey.currentContext!,
    builder: (appContext) {
      return Material(
        color: Colors.grey.withOpacity(0.3),
        child: SizedBox(
          height: 150.h,
          child: const Center(
            child: CircularProgressIndicator(color: AppColorsConstant.oxff4cc3c7),
          ),
        ),
      );
    },
  );
}

hideLoadingDialog() {
  Navigator.of(navigatorKey.currentContext!).pop();
}

Future<bool> askPermissionOpenSettingsDialog({required String permissionType}) async {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Please grant $permissionType permission from settings!",
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                //openAppSettings();
              },
              child: const Text("Settings"),
            ),
          ],
        );
      }).then((value) => false);
}
