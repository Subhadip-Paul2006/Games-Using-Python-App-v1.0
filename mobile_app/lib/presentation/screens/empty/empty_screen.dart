import 'package:flutter/material.dart';
import '../../widgets/state/state_widgets.dart';

class EmptyScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;

  const EmptyScreen({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyStateWidget(
        title: title ?? 'Nothing here yet',
        subtitle: subtitle,
        icon: icon ?? Icons.inbox_outlined,
      ),
    );
  }
}
