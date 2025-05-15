import 'package:flutter/material.dart';
import 'package:quora_clone_app/common/models/theme_model.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          color: context.themeColors.themeColor2,
        ),
      ),
    );
  }
}
