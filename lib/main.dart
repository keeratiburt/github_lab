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
// git push

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _darkModeKey = 'dark_mode';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = SharedPreferencesAsync();
  final isDarkMode = await preferences.getBool(_darkModeKey) ?? false;

  runApp(MyApp(preferences: preferences, initialDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.preferences,
    required this.initialDarkMode,
    super.key,
  });

  final SharedPreferencesAsync preferences;
  final bool initialDarkMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
  }

  Future<void> _changeTheme(bool isDarkMode) async {
    setState(() {
      _isDarkMode = isDarkMode;
    });

    await widget.preferences.setBool(_darkModeKey, isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyPage(isDarkMode: _isDarkMode, onThemeChanged: _changeTheme),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({
    required this.isDarkMode,
    required this.onThemeChanged,
    super.key,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Lab')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('กดปุ่มเพื่อไปหน้าโปรไฟล์'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const Text('Press'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 320,
              child: SwitchListTile(
                title: const Text('โหมดมืด'),
                subtitle: Text(isDarkMode ? 'เปิดใช้งาน' : 'ปิดใช้งาน'),
                secondary: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                value: isDarkMode,
                onChanged: onThemeChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('ย้อนกลับ'),
        ),
      ),
    );
  }
}
