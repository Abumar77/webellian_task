import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:alice/alice.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'features/authors/presentation/widgets/author_feature.dart';

class AuthorLibraryApp extends StatelessWidget {
  const AuthorLibraryApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Author Library',
    navigatorKey: kDebugMode ? getIt<Alice>().getNavigatorKey() : null,
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    home: const AuthorFeature(),
  );
}
