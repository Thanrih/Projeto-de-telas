import 'package:designsystemsampleapp/DesignSystem/Login/Login.dart';
import 'package:designsystemsampleapp/DesignSystem/Login/Signup.dart';
import 'package:designsystemsampleapp/DesignSystem/Login/Perfil.dart';

import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileScreen(name: '1', email: '22', phone: '12',),
    );
  }
}