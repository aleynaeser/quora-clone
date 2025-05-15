import 'widgets/post_card.dart';
import 'widgets/question_box.dart';
import 'package:flutter/material.dart';
import '../../core/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/bottom_loader.dart';
import '../../common/widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: BlocProvider(
        create: (context) => PostBloc()..add(PostFetched()),
        child: Column(
          children: [
            QuestionBox(),
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                switch (state.status) {
                  case PostStatus.failure:
                    return const Center(child: Text('failed to fetch posts'));
                  case PostStatus.success:
                    if (state.posts.isEmpty) {
                      return const Center(child: Text('no posts'));
                    }
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.posts.length
                            ? const BottomLoader()
                            : PostCard(post: state.posts[index]);
                      },
                      itemCount:
                          state.hasReachedMax
                              ? state.posts.length
                              : state.posts.length + 1,
                      controller: _scrollController,
                    );
                  case PostStatus.initial:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
