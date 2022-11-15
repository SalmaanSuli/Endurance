///
///Toggle Icon Button
///This class is for UX/UI purposes
///When toggle is open, show an icon to close
///When toggle is closed, show an icon to open
///

import 'package:flutter/material.dart';

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({
    required this.value,
    required this.onPressed,
    required this.onIcon,
    required this.offIcon,
  });

  final bool value;
  final Function() onPressed;
  final Widget onIcon;
  final Widget offIcon;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: value ? onIcon : offIcon,
      );
}
