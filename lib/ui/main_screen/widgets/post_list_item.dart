import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/posts/models/post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/constants/size_constants.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class PostListItem extends StatefulWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  final Random _random = Random();

  String _getRandomUpvotes() {
    double number = _random.nextDouble() * 9 + 1; // 1 to 10
    return '${number.toStringAsFixed(1)}K';
  }

  int _getRandomComments() {
    return _random.nextInt(50) + 1; // 1 to 50
  }

  int _getRandomReposts() {
    return _random.nextInt(100) + 1; // 1 to 100
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: context.themeColors.themeColor2,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.post.authorImage),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.author ?? '',
                        style: TextStyle(
                          fontSize: Sizes.smallTextSize,
                          color: context.themeColors.themeColor4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.post.source.name,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.themeColors.themeColor6,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/icons/more.svg',
                    width: Sizes.smallIconSize,
                    height: Sizes.smallIconSize,
                    colorFilter: ColorFilter.mode(
                      context.themeColors.themeColor6,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Post Content
              Text(
                widget.post.title,
                style: TextStyle(
                  fontSize: Sizes.largeTextSize,
                  color: context.themeColors.themeColor4,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.post.description ?? '',
                style: TextStyle(
                  fontSize: Sizes.mediumTextSize,
                  color: context.themeColors.themeColor4,
                ),
              ),
              const SizedBox(height: 16),

              // Actions
              Row(
                children: [
                  // Upvote
                  _buildActionButton(
                    'assets/icons/up-vote.svg',
                    _getRandomUpvotes(),
                  ),
                  const SizedBox(width: 24),

                  // Downvote
                  SvgPicture.asset(
                    'assets/icons/down-vote.svg',
                    width: Sizes.smallIconSize,
                    height: Sizes.smallIconSize,
                    colorFilter: ColorFilter.mode(
                      context.themeColors.themeColor6,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 24),

                  // Comment
                  _buildActionButton(
                    'assets/icons/comment.svg',
                    _getRandomComments().toString(),
                  ),
                  const SizedBox(width: 24),

                  // Republish
                  _buildActionButton(
                    'assets/icons/republish.svg',
                    _getRandomReposts().toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: Sizes.mediumPadding),
      ],
    );
  }

  Widget _buildActionButton(String icon, String count) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: Sizes.smallIconSize,
          height: Sizes.smallIconSize,
          colorFilter: ColorFilter.mode(
            context.themeColors.themeColor6,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            fontSize: Sizes.smallTextSize,
            color: context.themeColors.themeColor6,
          ),
        ),
      ],
    );
  }
}
