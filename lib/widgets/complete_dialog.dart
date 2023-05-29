import 'package:flutter/material.dart';

import '../data/app_strings.dart';
import '../data/custom_text_styles.dart';

class CompleteDialog extends StatelessWidget {
  const CompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.dialogTitle, style: CustomTextStyles.black30, textAlign: TextAlign.center,),
      content: const Text(AppStrings.dialogSubtitle, style: CustomTextStyles.black20, textAlign: TextAlign.center,),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text(AppStrings.close))
      ],
    );
  }
}
