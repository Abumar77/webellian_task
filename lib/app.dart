import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/authors/presentation/pages/author_feature.dart';

class AuthorLibraryApp extends StatelessWidget {
  const AuthorLibraryApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Author Library',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    home: const AuthorFeature(),
  );
}
