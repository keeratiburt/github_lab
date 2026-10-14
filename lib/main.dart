// git config user.name "Keeratiburt"
// git config user.email "abc@gmail.com"
// git add .
// git commit -m "Create button"
// git log --oneline
// git diff
// git add lib/main.dart
// git remote add origin https://github.com/keeratiburt/github_lab.git
// git remote -v
// git push -u origin main



import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String message = 'ยังไม่ได้กดปุ่ม';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Lab')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  message = 'กดปุ่มแล้ว!';
                });
              },
              child: const Text('Hello again'),
            ),
          ],
        ),
      ),
    );
  }
}