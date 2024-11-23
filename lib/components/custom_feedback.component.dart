import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/data/models/feedback.model.dart';
import 'package:flutter/material.dart';

class CustomFeedback extends StatelessWidget {
  final FeedbackType type;

  const CustomFeedback({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final feedback = FeedbackModel(type);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          feedback.getTitle(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        AutoSizeText(
          feedback.getDescription(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
