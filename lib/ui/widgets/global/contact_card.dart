import 'package:flutter/material.dart';

import '../../../app/hive/models/contact.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../texts/plus_jakarta_sans.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.onTap,
    required this.contact,
  });

  final Contact contact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.persianGreen,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: PlusJakartaSans(
                  contact.firstName.isNotEmpty
                      ? contact.firstName.substring(0, 1)
                      : 'x',
                  size: 14,
                  color: AppColors.white,
                ),
              ),
            ),
            horizontalSpaceSmall,
            PlusJakartaSans(
              '${contact.firstName} ${contact.lastName}',
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
