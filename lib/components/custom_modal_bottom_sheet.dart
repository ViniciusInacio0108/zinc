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
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
