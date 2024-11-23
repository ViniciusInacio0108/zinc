import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? flexibleSpace;
  final Size? size;
  final PreferredSizeWidget? bottom;

  const MyAppBar({
    super.key,
    required this.title,
    this.flexibleSpace,
    this.size,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: AutoSizeText(
        title,
        minFontSize: 20,
        maxFontSize: 22,
        style: const TextStyle().copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 2,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => size ?? const Size(double.infinity, 60);
}
