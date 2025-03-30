import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class ProfileImageButton extends StatelessWidget {
  const ProfileImageButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white30,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Icon(
            Icons.image_outlined,
            size: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Text(
            AppLocalization.of(context).get("chooseProfileImage"),
            style: TextTheme.of(context).titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
