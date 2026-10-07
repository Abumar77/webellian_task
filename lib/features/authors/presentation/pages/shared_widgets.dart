import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.info_outline,
  });
  final String message;
  final VoidCallback? onRetry;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ],
      ),
    ),
  );
}

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
        if (loading)
          const CircularProgressIndicator()
        else if (hasMore)
          OutlinedButton(
            onPressed: onMore,
            child: Text(error == null ? 'Load more' : 'Retry loading more'),
          ),
      ],
    ),
  );
}
