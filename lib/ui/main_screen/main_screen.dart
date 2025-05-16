import 'widgets/post_list.dart';
import 'widgets/question_box.dart';
import 'package:flutter/material.dart';
import '../../core/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: BlocProvider(
        create: (context) => PostBloc()..add(PostFetched()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification) {
                  if (scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent * 0.9) {
                    context.read<PostBloc>().add(PostFetched());
                  }
                }
                return true;
              },
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: QuestionBox()),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 6),
                    sliver: PostList(state: state),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
