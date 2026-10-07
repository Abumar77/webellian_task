import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NetworkLogsButton extends StatelessWidget {
  const NetworkLogsButton({super.key, required this.container});
  final GetIt container;

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return const SizedBox.shrink();
    return IconButton(
      tooltip: 'Network logs',
      icon: const Icon(Icons.bug_report_outlined),
      onPressed: () => container<Alice>().showInspector(),
    );
  }
}
