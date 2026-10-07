import 'package:equatable/equatable.dart';

class Author extends Equatable {
  const Author({
    required this.id,
    required this.name,
    this.birthDate,
    this.deathDate,
    this.topWork,
  });
  final String id;
  final String name;
  final String? birthDate;
  final String? deathDate;
  final String? topWork;

  @override
  List<Object?> get props => [id, name, birthDate, deathDate, topWork];
}

class AuthorWork extends Equatable {
  const AuthorWork({
    required this.id,
    required this.title,
    this.firstPublishDate,
  });
  final String id;
  final String title;
  final String? firstPublishDate;

  @override
  List<Object?> get props => [id, title, firstPublishDate];
}

class PageResult<T> {
  PageResult({
    required List<T> items,
    required this.total,
    required this.offset,
  }) : items = List.unmodifiable(items);
  final List<T> items;
  final int total;
  final int offset;
  int get nextOffset => offset + items.length;
  bool get hasMore => items.isNotEmpty && nextOffset < total;
}
