import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/features/authors/domain/author.dart';

void main() {
  test('author copies preserve the source and can clear optional metadata', () {
    const author = Author(id: 'OL1A', name: 'Jane', topWork: 'Book');
    final updated = author.copyWith(name: 'Jane Austen', topWork: null);
    expect(author.name, 'Jane');
    expect(author.topWork, 'Book');
    expect(updated, const Author(id: 'OL1A', name: 'Jane Austen'));
    expect(
      updated.hashCode,
      const Author(id: 'OL1A', name: 'Jane Austen').hashCode,
    );
  });

  test('work copies retain unchanged fields', () {
    const work = AuthorWork(id: '/works/OL1W', title: 'Book');
    expect(
      work.copyWith(firstPublishDate: '1813'),
      const AuthorWork(
        id: '/works/OL1W',
        title: 'Book',
        firstPublishDate: '1813',
      ),
    );
  });

  test('pages compare collections by value and expose unmodifiable items', () {
    final page = PageResult(
      items: [const Author(id: 'OL1A', name: 'Jane')],
      total: 2,
      offset: 0,
    );
    expect(
      page,
      const PageResult(
        items: [Author(id: 'OL1A', name: 'Jane')],
        total: 2,
        offset: 0,
      ),
    );
    expect(() => page.items.clear(), throwsUnsupportedError);
    expect(page.nextOffset, 1);
    expect(page.hasMore, isTrue);
    expect(page.copyWith(total: 1).hasMore, isFalse);
  });
}
