import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:quora_clone_app/core/posts/models/post.dart';
import '../repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc() : _postRepository = PostRepository(), super(const PostState()) {
    on<PostFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetched(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    print('state.currentPage: ${state.currentPage}');
    try {
      final posts = await _postRepository.fetchPosts(
        startIndex: state.currentPage,
      );

      if (posts.articles.isEmpty ||
          posts.articles.length >= posts.totalResults) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      emit(
        state.copyWith(
          status: PostStatus.success,
          currentPage: state.currentPage + 1,
          response: PostResponse(
            status: posts.status,
            totalResults: posts.totalResults,
            articles: [...state.response.articles, ...posts.articles],
          ),
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
