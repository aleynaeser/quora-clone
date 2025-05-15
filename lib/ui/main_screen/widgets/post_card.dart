import 'package:flutter/material.dart';
import '../../../core/posts/models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.post);
    return const Placeholder();
  }
}
