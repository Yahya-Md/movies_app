import 'package:flutter/material.dart';
import 'package:movies_app/core/style/app_colors.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final VoidCallback? onTapRightButton;
  const SectionHeaderWidget({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.onTapRightButton,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftTitle,
          style: textTheme.headlineMedium
              ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: onTapRightButton,
          child: Text(
            rightTitle,
            style: textTheme.bodyLarge?.copyWith(
                color: AppColors.white.withValues(alpha: 0.5),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
