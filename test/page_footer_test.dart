import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/features/authors/presentation/widgets/page_footer.dart';

void main() {
  testWidgets('loading keeps button size, disables repeat taps, and animates', (
    tester,
  ) async {
    var requests = 0;
    Widget footer(bool loading) => MaterialApp(
      home: Scaffold(
        body: Center(
          child: PageFooter(
            loading: loading,
            hasMore: true,
            onMore: () => requests++,
          ),
        ),
      ),
    );
    await tester.pumpWidget(footer(false));
    final size = tester.getSize(find.byType(OutlinedButton));
    await tester.tap(find.byType(OutlinedButton));
    expect(requests, 1);
    await tester.pumpWidget(footer(true));
    expect(tester.getSize(find.byType(OutlinedButton)), size);
    expect(
      tester.widget<OutlinedButton>(find.byType(OutlinedButton)).onPressed,
      isNull,
    );
    await tester.tap(find.byType(OutlinedButton));
    expect(requests, 1);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.binding.hasScheduledFrame, isTrue);
    await tester.pumpWidget(footer(false));
    await tester.pumpAndSettle();
    expect(find.text('Load more'), findsOneWidget);
  });
}
