import 'package:flutter/material.dart';
import 'package:flutter_prevent_nap/flutter_prevent_nap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final preventNap = FlutterPreventNap();
              final key = await preventNap.beginActivity("");

              // do something important

              preventNap.endActivity(key);
            },
            child: const Text("Execute an important task!"),
          ),
        ),
      ),
    );
  }
}
