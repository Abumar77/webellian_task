import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/di/injection.dart';
import '../bloc/search/search_bloc.dart';
import 'search_page.dart';

class AuthorFeature extends StatelessWidget {
  const AuthorFeature({super.key, this.container});
  final GetIt? container;

  @override
  Widget build(BuildContext context) {
    final locator = container ?? getIt;
    return BlocProvider(
      create: (_) => locator<SearchBloc>(),
      child: SearchPage(container: locator),
    );
  }
}
