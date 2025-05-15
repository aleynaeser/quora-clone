import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/theme_constants.dart';
import '../constants/size_constants.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavBarItem(icon: 'home.svg', label: 'Home'),
      _NavBarItem(icon: 'following.svg', label: 'Following'),
      _NavBarItem(icon: 'spaces.svg', label: 'Spaces'),
      _NavBarItem(icon: 'notification.svg', label: 'Notifications'),
      _NavBarItem(icon: 'more.svg', label: 'More'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/${item.icon}',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? context.themeColors.themeColor3
                          : context.themeColors.themeColor6,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.label,
                    style: TextStyle(
                      color:
                          isSelected
                              ? context.themeColors.themeColor3
                              : context.themeColors.themeColor6,
                      fontSize: Sizes.smallTextSize,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavBarItem {
  final String icon;
  final String label;
  _NavBarItem({required this.icon, required this.label});
}
