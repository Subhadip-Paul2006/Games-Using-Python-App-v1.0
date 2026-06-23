import 'package:flutter/material.dart';

class TouchDPad extends StatelessWidget {
  final VoidCallback? onUp;
  final VoidCallback? onDown;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final double size;

  const TouchDPad({
    super.key,
    this.onUp,
    this.onDown,
    this.onLeft,
    this.onRight,
    this.size = 160,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final btnSize = size * 0.3;
    final iconSize = size * 0.12;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: _DPadButton(
              onPressed: onUp,
              child: Icon(Icons.arrow_upward, size: iconSize),
              size: btnSize,
            ),
          ),
          Positioned(
            bottom: 0,
            child: _DPadButton(
              onPressed: onDown,
              child: Icon(Icons.arrow_downward, size: iconSize),
              size: btnSize,
            ),
          ),
          Positioned(
            left: 0,
            child: _DPadButton(
              onPressed: onLeft,
              child: Icon(Icons.arrow_back, size: iconSize),
              size: btnSize,
            ),
          ),
          Positioned(
            right: 0,
            child: _DPadButton(
              onPressed: onRight,
              child: Icon(Icons.arrow_forward, size: iconSize),
              size: btnSize,
            ),
          ),
          Container(
            width: btnSize * 0.6,
            height: btnSize * 0.6,
            decoration: BoxDecoration(
              color: scheme.surfaceVariant.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _DPadButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double size;

  const _DPadButton({
    this.onPressed,
    required this.child,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: scheme.surfaceVariant.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: scheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class SwipeArea extends StatelessWidget {
  final Widget child;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  final VoidCallback? onSwipeUp;
  final VoidCallback? onSwipeDown;

  const SwipeArea({
    super.key,
    required this.child,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeUp,
    this.onSwipeDown,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;
        if (details.primaryVelocity! < -300) {
          onSwipeLeft?.call();
        } else if (details.primaryVelocity! > 300) {
          onSwipeRight?.call();
        }
      },
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity == null) return;
        if (details.primaryVelocity! < -300) {
          onSwipeUp?.call();
        } else if (details.primaryVelocity! > 300) {
          onSwipeDown?.call();
        }
      },
      child: child,
    );
  }
}
