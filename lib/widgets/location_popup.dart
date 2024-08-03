import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

Future<bool> getLocationPopup(BuildContext context) async {
  Completer<bool> completer = Completer<bool>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('We need to access your Location to start Tracking'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              completer.complete(false); // User canceled, so return false
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              var status = await Permission.location.request();
              if (status.isGranted) {
                completer.complete(true); // Permission granted
              } else {
                await openAppSettings();
                var newStatus = await Permission.location.request();
                completer.complete(newStatus.isGranted);
              }
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );

  return completer.future;
}
