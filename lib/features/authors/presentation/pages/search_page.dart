import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/author.dart';
import 'package:get_it/get_it.dart';
import '../bloc/search_bloc.dart';
import 'works_page.dart';
import 'shared_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.container});
  final GetIt container;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Author Library')),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Find the voices behind your favorite books.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Search authors and explore their works on Open Library.',
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _controller,
                  onChanged: (query) =>
                      context.read<SearchBloc>().add(QueryChanged(query)),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Author name',
                    hintText: 'Try Jane Austen',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      tooltip: 'Clear search',
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        context.read<SearchBloc>().add(QueryChanged(''));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case SearchStatus.initial:
                          return const MessageView(
                            icon: Icons.menu_book_outlined,
                            message: 'Your next discovery starts with a name.',
                          );
                        case SearchStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case SearchStatus.failure:
                          return MessageView(
                            message: state.error!,
                            onRetry: () =>
                                context.read<SearchBloc>().add(SearchRetried()),
                          );
                        case SearchStatus.success:
                          if (state.authors.isEmpty) {
                            return MessageView(
                              message:
                                  'No authors found for “${state.query}”. Try another name.',
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.total} authors found',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.authors.length + 1,
                                  itemBuilder: (context, index) =>
                                      index == state.authors.length
                                      ? PageFooter(
                                          loading: state.loadingMore,
                                          hasMore: state.hasMore,
                                          error: state.error,
                                          onMore: () => context
                                              .read<SearchBloc>()
                                              .add(MoreAuthorsRequested()),
                                        )
                                      : _AuthorCard(
                                          author: state.authors[index],
                                          onTap: () =>
                                              Navigator.of(context).push(
                                                MaterialPageRoute<void>(
                                                  builder: (_) => WorksPage(
                                                    author:
                                                        state.authors[index],
                                                    container: widget.container,
                                                  ),
                                                ),
                                              ),
                                        ),
                                ),
                              ),
                            ],
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _AuthorCard extends StatelessWidget {
  const _AuthorCard({required this.author, required this.onTap});
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
