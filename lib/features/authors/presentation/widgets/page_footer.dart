import 'package:flutter/material.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({
    super.key,
    required this.loading,
    required this.hasMore,
    required this.onMore,
    this.error,
  });
  final bool loading;
  final bool hasMore;
  final VoidCallback onMore;
  final String? error;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      children: [
        if (error != null) Text(error!, textAlign: TextAlign.center),
        if (loading || hasMore)
          OutlinedButton(
            onPressed: loading ? null : onMore,
            child: SizedBox(
              width: 160,
              height: 24,
              child: Center(
                child: loading
                    ? Semantics(
                        label: 'Loading more results',
                        child: const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : Text(error == null ? 'Load more' : 'Retry loading more'),
              ),
            ),
          ),
      ],
    ),
  );
}
