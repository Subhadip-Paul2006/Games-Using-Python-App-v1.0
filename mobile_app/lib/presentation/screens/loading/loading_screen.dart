import 'package:flutter/material.dart';
import '../../widgets/state/state_widgets.dart';

class LoadingScreen extends StatelessWidget {
  final ShimmerType type;

  const LoadingScreen({
    super.key,
    this.type = ShimmerType.grid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingShimmer(type: type),
    );
  }
}
