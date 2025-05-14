import 'package:flutter/material.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

import '../constants/size_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.themeColors.themeColor2,
      elevation: 0,
      toolbarHeight: 80,
      leading: CircleAvatar(
        backgroundImage: const AssetImage('assets/images/avatar.png'),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
