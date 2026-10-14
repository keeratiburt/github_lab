import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyPage()));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: const Center(child: Text('Hello, World!')),
    );
  }
}