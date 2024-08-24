import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCustomElevatedButton extends StatelessWidget {
  const MyCustomElevatedButton({
    super.key,
    required this.isActivated,
    required this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;
  final bool isActivated;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActivated ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        disabledBackgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: AutoSizeText(
        label,
        style: const TextStyle().copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
