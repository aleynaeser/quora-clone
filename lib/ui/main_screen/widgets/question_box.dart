import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeColors.themeColor2,
      padding: const EdgeInsets.only(
        left: Sizes.mediumPadding,
        right: Sizes.mediumPadding,
        top: Sizes.smallPadding,
        bottom: 6.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: Sizes.smallPadding),
              Expanded(
                child: SizedBox(
                  height: 26,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: context.themeColors.themeColor1,
                      foregroundColor: context.themeColors.themeColor2,
                      side: BorderSide(color: context.themeColors.themeColor8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Sizes.largeBorderRadius,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.smallPadding,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What do you want to ask or share?',
                        style: TextStyle(
                          color: context.themeColors.themeColor5,
                          fontSize: Sizes.smallTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _QuestionBoxButton(icon: "ask.svg", label: 'Ask'),
              _VerticalDivider(),
              _QuestionBoxButton(icon: "answer.svg", label: 'Answer'),
              _VerticalDivider(),
              _QuestionBoxButton(icon: "post.svg", label: 'Post'),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuestionBoxButton extends StatefulWidget {
  final String icon;
  final String label;

  const _QuestionBoxButton({required this.icon, required this.label});

  @override
  State<_QuestionBoxButton> createState() => _QuestionBoxButtonState();
}

class _QuestionBoxButtonState extends State<_QuestionBoxButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: context.themeColors.themeColor9,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/${widget.icon}',
              colorFilter: ColorFilter.mode(
                context.themeColors.themeColor6,
                BlendMode.srcIn,
              ),
              width: Sizes.mediumIconSize,
              height: Sizes.mediumIconSize,
            ),
            const SizedBox(width: 6),
            Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.smallTextSize,
                color: context.themeColors.themeColor6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 24,
      color: context.themeColors.themeColor8,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
