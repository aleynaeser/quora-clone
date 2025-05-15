import 'package:flutter/material.dart';
import '../constants/size_constants.dart';
import '../constants/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'home.svg',
      'following.svg',
      'share.svg',
      'spaces.svg',
      'notification.svg',
    ];

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: context.themeColors.themeColor2,
        border: Border(top: BorderSide(color: context.themeColors.themeColor8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == 0;

          return Expanded(
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/$item',
                width: Sizes.largeIconSize,
                height: Sizes.largeIconSize,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? context.themeColors.themeColor3
                      : context.themeColors.themeColor6,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
