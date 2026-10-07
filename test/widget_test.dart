import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webellian_task/core/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/features/authors/domain/author.dart';
import 'package:webellian_task/features/authors/domain/author_repository.dart';
import 'package:webellian_task/features/authors/presentation/pages/author_feature.dart';

class FakeRepository implements AuthorRepository {
  @override
  Future<PageResult<Author>> search(String query, {int offset = 0}) async =>
      PageResult(
        items: const [
          Author(
            id: 'OL1A',
            name: 'Jane Austen',
            birthDate: '1775',
            deathDate: '1817',
            topWork: 'Pride and Prejudice',
          ),
        ],
        total: 1,
        offset: offset,
      );
  @override
  Future<PageResult<AuthorWork>> works(String id, {int offset = 0}) async =>
      PageResult(
        items: const [
          AuthorWork(id: '/works/OL1W', title: 'Pride and Prejudice'),
        ],
        total: 1,
        offset: offset,
      );
}

void main() {
  testWidgets('search displays author details and opens their works', (
    tester,
  ) async {
    final container = GetIt.asNewInstance();
    configureDependencies(container: container, repository: FakeRepository());
    addTearDown(container.reset);
    await tester.pumpWidget(
      MaterialApp(home: AuthorFeature(container: container)),
    );
    await tester.enterText(find.byType(TextField), 'Jane');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 401));
    await tester.pumpAndSettle();
    expect(find.text('Jane Austen'), findsOneWidget);
    expect(find.text('Born: 1775'), findsOneWidget);
    expect(find.text('Died: 1817'), findsOneWidget);
    await tester.tap(find.text('Jane Austen'));
    await tester.pumpAndSettle();
    expect(find.text('1 works'), findsOneWidget);
    expect(find.text('Pride and Prejudice'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Clear search'));
    await tester.pumpAndSettle();
    expect(
      find.text('Your next discovery starts with a name.'),
      findsOneWidget,
    );
  });
}
