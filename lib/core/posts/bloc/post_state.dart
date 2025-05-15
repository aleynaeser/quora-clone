part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.hasReachedMax = false,
    this.status = PostStatus.initial,
    this.currentPage = 1,
    this.response = const PostResponse(
      status: '',
      totalResults: 0,
      articles: [],
    ),
  });

  final PostStatus status;
  final bool hasReachedMax;
  final int currentPage;
  final PostResponse response;

  PostState copyWith({
    PostStatus? status,
    PostResponse? response,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return PostState(
      status: status ?? this.status,
      response: response ?? this.response,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, currentPage: $currentPage, response: ${response.articles.length} }''';
  }

  @override
  List<Object> get props => [status, response, hasReachedMax, currentPage];
}
