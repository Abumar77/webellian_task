import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/search/search_bloc.dart';
import 'works_page.dart';
import '../widgets/message_view.dart';
import '../widgets/page_footer.dart';
import '../widgets/author_card.dart';
import '../widgets/network_logs_button.dart';

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
    appBar: AppBar(
      title: const Text('Author Library'),
      actions: [NetworkLogsButton(container: widget.container)],
    ),
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
                  autocorrect: false,
                  enableSuggestions: false,
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
                                      : AuthorCard(
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
