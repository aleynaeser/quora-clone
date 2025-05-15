import 'post_list_item.dart';
import 'package:flutter/material.dart';
import '../../../core/posts/bloc/post_bloc.dart';
import '../../../common/widgets/bottom_loader.dart';
import '../../../common/constants/size_constants.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class PostList extends StatelessWidget {
  final PostState state;

  const PostList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var response = state.response;

    switch (state.status) {
      case PostStatus.failure:
        return const SliverToBoxAdapter(
          child: Center(child: Text('Failed to fetch posts...')),
        );
      case PostStatus.success:
        if (response.articles.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No Posts...')),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var posts = response.articles;

              return index >= posts.length
                  ? const BottomLoader()
                  : PostListItem(post: posts[index]);
            },
            childCount:
                state.hasReachedMax
                    ? response.totalResults
                    : response.articles.length + 1,
          ),
        );
      case PostStatus.initial:
        return SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(
              color: context.themeColors.themeColor2,
              padding: EdgeInsets.all(Sizes.mediumPadding),
            ),
          ),
        );
    }
  }
}
