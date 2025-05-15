import 'package:flutter/material.dart';
import '../constants/size_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 65,
      leadingWidth: 55,
      backgroundColor: context.themeColors.themeColor1,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: context.themeColors.themeColor8, height: 1),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.mediumPadding,
          top: Sizes.smallPadding,
          bottom: Sizes.smallPadding,
        ),
        child: CircleAvatar(
          backgroundImage: const AssetImage('assets/images/avatar.png'),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: context.themeColors.themeColor6,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.smallPadding),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(
                context.themeColors.themeColor6,
                BlendMode.srcIn,
              ),
              width: Sizes.mediumIconSize,
              height: Sizes.mediumIconSize,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Sizes.smallPadding,
            right: Sizes.mediumPadding,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/circle-plus.svg",
              colorFilter: ColorFilter.mode(
                context.themeColors.themeColor6,
                BlendMode.srcIn,
              ),
              width: Sizes.mediumIconSize,
              height: Sizes.mediumIconSize,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
