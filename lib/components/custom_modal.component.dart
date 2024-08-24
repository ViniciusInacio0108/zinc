import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCustomFeedbackModal {
  const MyCustomFeedbackModal({
    required this.bodyMessage,
    required this.title,
  });

  final String title;
  final String bodyMessage;

  Future<void> showModal(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      enableDrag: true,
      isDismissible: true,
      showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.bounceOut,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  maxFontSize: 28,
                  minFontSize: 24,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                AutoSizeText(
                  bodyMessage,
                  maxFontSize: 16,
                  minFontSize: 12,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
