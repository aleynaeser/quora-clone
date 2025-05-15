import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../core/posts/models/post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/utils/date_utils.dart';
import '../../../common/utils/random_utils.dart';
import '../../../common/constants/size_constants.dart';
import '../../../core/posts/repository/post_repository.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class PostListItem extends StatefulWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  Uint8List? _imageBytes;
  final PostRepository _postRepository = PostRepository();

  @override
  void initState() {
    super.initState();
    _postRepository.loadImage(widget.post.urlToImage).then((value) {
      setState(() {
        _imageBytes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      children: [
        Container(
          color: context.themeColors.themeColor2,
          padding: const EdgeInsets.only(top: Sizes.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author Info
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.mediumPadding,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: context.themeColors.themeColor1,
                      backgroundImage: NetworkImage(post.authorImage),
                    ),
                    const SizedBox(width: Sizes.smallPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              post.author ?? '',
                              style: TextStyle(
                                fontSize: Sizes.smallTextSize,
                                color: context.themeColors.themeColor4,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 10,
                                color: context.themeColors.themeColor6,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: const Size(0, 0),
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  fontSize: Sizes.smallTextSize,
                                  color: context.themeColors.themeColor10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text(
                              post.source.name,
                              style: TextStyle(
                                fontSize: Sizes.mediumTextSize,
                                color: context.themeColors.themeColor6,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 10,
                                color: context.themeColors.themeColor6,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              formatPublishedDate(post.publishedAt),
                              style: TextStyle(
                                fontSize: Sizes.smallTextSize,
                                color: context.themeColors.themeColor6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/close.svg',
                        width: Sizes.mediumIconSize,
                        height: Sizes.mediumIconSize,
                        colorFilter: ColorFilter.mode(
                          context.themeColors.themeColor6,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.smallPadding),

              // Post Content
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.mediumPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        fontSize: Sizes.largeTextSize,
                        color: context.themeColors.themeColor4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.description ?? '',
                      style: TextStyle(
                        fontSize: Sizes.mediumTextSize,
                        color: context.themeColors.themeColor4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.smallPadding),

              //Post Image
              if (post.urlToImage != null && _imageBytes != null)
                Image.memory(
                  _imageBytes!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

              // Actions
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: Sizes.mediumPadding,
                ),
                child: Row(
                  children: [
                    // Upvote
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.themeColors.themeColor7,
                        border: Border.all(
                          color: context.themeColors.themeColor8,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/up-vote.svg',
                              width: Sizes.mediumIconSize,
                              height: Sizes.mediumIconSize,
                              colorFilter: ColorFilter.mode(
                                context.themeColors.themeColor10, // mavi
                                BlendMode.srcIn,
                              ),
                            ),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Upvote',
                            style: TextStyle(
                              fontSize: Sizes.smallTextSize,
                              color: context.themeColors.themeColor6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '•',
                            style: TextStyle(
                              fontSize: 10,
                              color: context.themeColors.themeColor6,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            getRandomUpvotes(),
                            style: TextStyle(
                              fontSize: Sizes.smallTextSize,
                              color: context.themeColors.themeColor6,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(width: Sizes.smallPadding),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: context.themeColors.themeColor8,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/down-vote.svg',
                                width: Sizes.mediumIconSize,
                                height: Sizes.mediumIconSize,
                                colorFilter: ColorFilter.mode(
                                  context.themeColors.themeColor6,
                                  BlendMode.srcIn,
                                ),
                              ),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Comment
                    _buildActionButton(
                      'assets/icons/comment.svg',
                      getRandomComments().toString(),
                    ),
                    const SizedBox(width: 12),

                    // Republish
                    _buildActionButton(
                      'assets/icons/republish.svg',
                      getRandomReposts().toString(),
                    ),
                    const Spacer(),

                    // More
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/more.svg',
                        width: Sizes.mediumIconSize,
                        height: Sizes.mediumIconSize,
                        colorFilter: ColorFilter.mode(
                          context.themeColors.themeColor6,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Sizes.smallPadding),
      ],
    );
  }

  Widget _buildActionButton(String icon, String count) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset(
            icon,
            width: Sizes.mediumIconSize,
            height: Sizes.mediumIconSize,
            colorFilter: ColorFilter.mode(
              context.themeColors.themeColor6,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 6),
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
