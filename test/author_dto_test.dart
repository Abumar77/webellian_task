import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:webellian_task/features/authors/data/models/author_dto.dart';

void main() {
  test('author response serializes nested API fields and round trips', () {
    final response = AuthorSearchResponseDto.fromJson({
      'numFound': 1,
      'docs': [
        {
          'key': '/authors/OL1A',
          'name': ' Jane ',
          'birth_date': '1775',
          'death_date': '1817',
          'top_work': 'Book',
        },
      ],
    });
    final json = response.toJson();
    expect((json['docs'] as List).single, {
      'key': '/authors/OL1A',
      'name': 'Jane',
      'birth_date': '1775',
      'death_date': '1817',
      'top_work': 'Book',
    });
    expect(AuthorSearchResponseDto.fromJson(json), response);
    expect(response.authors.single.toDomain().id, 'OL1A');
  });

  test('works response round trips and normalizes blank metadata', () {
    final response = AuthorWorksResponseDto.fromJson({
      'size': 1,
      'entries': [
        {'key': '/works/OL1W', 'title': 'Book', 'first_publish_date': ' '},
      ],
    });
    expect(response.works.single.firstPublishDate, isNull);
    expect(AuthorWorksResponseDto.fromJson(response.toJson()), response);
    expect(response.works.single.toDomain().id, '/works/OL1W');
  });

  test('invalid counts and records fail checked deserialization', () {
    for (final total in [-1, '1', 1.5, null]) {
      expect(
        () => AuthorSearchResponseDto.fromJson({'numFound': total, 'docs': []}),
        throwsA(isA<CheckedFromJsonException>()),
      );
    }
    expect(
      () => AuthorSearchResponseDto.fromJson({
        'numFound': 1,
        'docs': [
          {'key': 'OL1A', 'name': ' '},
        ],
      }),
      throwsA(isA<CheckedFromJsonException>()),
    );
  });
}
