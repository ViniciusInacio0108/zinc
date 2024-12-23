import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCustomElevatedButton extends StatelessWidget {
  const MyCustomElevatedButton({
    super.key,
    required this.isActivated,
    required this.onPressed,
    this.isSecondaryStyle,
    this.isLoading = false,
    required this.label,
  });

  final void Function()? onPressed;
  final bool isActivated;
  final bool? isSecondaryStyle;
  final String label;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActivated
          ? onPressed
          : isLoading == true
              ? () {}
              : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSecondaryStyle == true ? Theme.of(context).colorScheme.primary : Colors.white,
        disabledBackgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: (isLoading == true)
          ? const SizedBox.shrink(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : AutoSizeText(
              label,
              style: const TextStyle().copyWith(
                color: isSecondaryStyle == true
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
    );
  }
}
