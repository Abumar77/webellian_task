import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/open_library_api.dart';
import '../../data/open_library_repository.dart';
import '../../domain/author_repository.dart';
import '../bloc/search_bloc.dart';
import 'search_page.dart';

/// Feature composition root: dependencies and Bloc live with this widget.
class AuthorFeature extends StatefulWidget {
  const AuthorFeature({super.key, this.repository});
  final AuthorRepository? repository;
  @override
  State<AuthorFeature> createState() => _AuthorFeatureState();
}

class _AuthorFeatureState extends State<AuthorFeature> {
  Dio? _dio;
  late final AuthorRepository _repository;
  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? _createRepository();
  }

  AuthorRepository _createRepository() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://openlibrary.org',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );
    _dio = dio;
    return OpenLibraryRepository(OpenLibraryApi(dio));
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SearchBloc(SearchAuthors(_repository)),
    child: SearchPage(repository: _repository),
  );
  @override
  void dispose() {
    _dio?.close(force: true);
    super.dispose();
  }
}
