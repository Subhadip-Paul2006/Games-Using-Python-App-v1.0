import 'package:flutter/material.dart';
import '../../widgets/state/state_widgets.dart';

class ErrorScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onRetry;

  const ErrorScreen({
    super.key,
    this.title,
    this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorStateWidget(
        title: title ?? 'Something went wrong',
        subtitle: subtitle ?? 'Check your connection and try again.',
        onRetry: onRetry,
      ),
    );
  }
}
