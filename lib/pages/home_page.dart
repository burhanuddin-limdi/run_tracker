// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:run_tracker/widgets/location_denied_popup.dart';
import 'package:run_tracker/widgets/location_popup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () async {
                bool result = await getLocationPopup(context);
                if (result) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Permission Granted')));
                } else {
                  locationDeniedPopup(context);
                }
              },
              child: const Text('Start Run'),
            ),
          ],
        ),
      ),
    );
  }
}
