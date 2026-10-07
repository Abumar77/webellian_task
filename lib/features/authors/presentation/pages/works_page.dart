import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/author.dart';
import 'package:get_it/get_it.dart';
import '../bloc/works/works_bloc.dart';
import 'shared_widgets.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key, required this.author, required this.container});
  final Author author;
  final GetIt container;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) =>
        container<WorksBloc>(param1: author.id)..add(WorksRequested()),
    child: Scaffold(
      appBar: AppBar(title: Text(author.name)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: BlocBuilder<WorksBloc, WorksState>(
              builder: (context, state) {
                if (state.loading && !state.loaded) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null && !state.loaded) {
                  return MessageView(
                    message: state.error!,
                    onRetry: () =>
                        context.read<WorksBloc>().add(WorksRequested()),
                  );
                }
                if (!state.loaded) return const SizedBox.shrink();
                if (state.works.isEmpty) {
                  return const MessageView(
                    message: 'No works listed for this author.',
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: state.works.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          '${state.total} works',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    }
                    if (index == state.works.length + 1) {
                      return PageFooter(
                        loading: state.loading,
                        hasMore: state.hasMore,
                        error: state.error,
                        onMore: () =>
                            context.read<WorksBloc>().add(MoreWorksRequested()),
                      );
                    }
                    final work = state.works[index - 1];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.menu_book_outlined),
                        title: Text(work.title),
                        subtitle: Text(
                          'First published: ${work.firstPublishDate ?? "Not listed"}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
