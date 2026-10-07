import 'package:flutter/material.dart';
import 'features/authors/presentation/pages/author_feature.dart';

class AuthorLibraryApp extends StatelessWidget {
  const AuthorLibraryApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Author Library',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF265D54)),
      scaffoldBackgroundColor: const Color(0xFFF7F6F2),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      useMaterial3: true,
    ),
    home: const AuthorFeature(),
  );
}
