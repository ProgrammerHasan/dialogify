import 'package:flutter/material.dart';
import 'package:dialogify/dialogify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogify Example',
      home: Scaffold(
        appBar: AppBar(title: const Text("Dialogify Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                    context,
                    title: "Confirm Action",
                    subtitle: "Do you want to proceed?",
                    onConfirm: () => debugPrint("Confirmed!"),
                    onCancel: () => debugPrint("Cancelled!"),
                  );
                },
                child: const Text("Show Confirmation Dialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  showInfoDialog(
                    context,
                    title: "Info",
                    subtitle: "This is an information dialog.",
                    onClose: () => debugPrint("Closed!"),
                  );
                },
                child: const Text("Show Info Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}