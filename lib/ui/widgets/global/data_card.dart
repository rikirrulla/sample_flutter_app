import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../texts/plus_jakarta_sans.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;

  const DataCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.kcBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlusJakartaSans(
          subtitle,
          size: 12,
          color: AppColors.kcMediumGrey,
        ),
        const SizedBox(height: 5),
        PlusJakartaSans.semiBold(
          title,
          size: 14,
          color: titleColor,
        ),
        const SizedBox(height: 3),
        Container(
          height: 1,
          color: AppColors.kcMediumGrey,
        ),
      ],
    );
  }
}
