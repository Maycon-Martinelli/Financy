import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoção',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LoginView(),
    );
  }
}
