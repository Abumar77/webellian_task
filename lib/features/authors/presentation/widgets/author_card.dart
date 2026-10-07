import 'package:flutter/material.dart';
import '../../domain/author.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.author, required this.onTap});
  final Author author;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('Born: ${author.birthDate ?? "Unknown"}'),
                  Text('Died: ${author.deathDate ?? "Not listed"}'),
                  const SizedBox(height: 12),
                  Text(
                    'TOP WORK',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author.topWork ?? 'Not listed',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    ),
  );
}
