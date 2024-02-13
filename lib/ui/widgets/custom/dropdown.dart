import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../texts/plus_jakarta_sans.dart';

class ContactDropDown extends StatelessWidget {
  final String value;
  final Color color;
  final String mandatory;
  final List<String> options;
  final Function(String) onChanged;

  const ContactDropDown({
    super.key,
    required this.options,
    required this.mandatory,
    required this.onChanged,
    this.value = '',
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kcVeryLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: PlusJakartaSans.medium(
          mandatory,
          size: 14,
          color: color,
        ),
        contentPadding: const EdgeInsets.fromLTRB(15, 2, 10, 2),
        trailing: DropdownButton(
          dropdownColor: AppColors.kcVeryLightGrey,
          hint: const PlusJakartaSans(
            'Any',
            size: 14,
            color: AppColors.kcMediumGrey,
          ),
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.persianGreen,
          ),
          underline: const SizedBox(),
          items: options.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: PlusJakartaSans.medium(
                    items,
                    size: 14,
                    maxLines: 1,
                    color: AppColors.kcDarkGreyColor,
                    textAlign: TextAlign.end,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) => onChanged(value.toString()),
        ),
      ),
    );
  }
}
