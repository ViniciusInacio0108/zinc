import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCustomBottonSheet {
  Future<void> callFeedbackText(BuildContext context, String text) async {
    await showModalBottomSheet(
      context: context,
      elevation: 0,
      showDragHandle: true,
      builder: (_) => SizedBox(
        width: double.infinity,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: AutoSizeText(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> textWithSingleButton(BuildContext context, String text, Widget button) async {
    await showModalBottomSheet(
      context: context,
      elevation: 0,
      showDragHandle: true,
      builder: (_) => Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  text,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                button,
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
