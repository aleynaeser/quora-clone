import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeColors.themeColor2,
      padding: const EdgeInsets.all(Sizes.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              const SizedBox(width: Sizes.mediumPadding),
              Expanded(
                child: SizedBox(
                  height: 32,
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
          const SizedBox(height: Sizes.smallPadding),
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
            const SizedBox(width: 4),
            Text(
              widget.label,
              style: TextStyle(
                color: context.themeColors.themeColor6,
                fontSize: Sizes.smallTextSize,
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
      height: 24,
      width: 1,
      color: context.themeColors.themeColor8,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
