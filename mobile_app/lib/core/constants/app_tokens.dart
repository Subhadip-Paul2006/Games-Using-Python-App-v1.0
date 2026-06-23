class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  static const double pageHorizontal = 16.0;
  static const double pageVertical = 16.0;
  static const double sectionGap = 24.0;
  static const double itemGap = 8.0;
}

class AppRadius {
  AppRadius._();

  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double pill = 999.0;
  static const double navTop = 28.0;
}

class AppSize {
  AppSize._();

  static const double touchTarget = 48.0;
  static const double primaryAction = 56.0;
  static const double iconGlyph = 20.0;
  static const double iconTouch = 24.0;
  static const double gameTile = 56.0;
  static const double bottomNav = 56.0;
  static const double bottomNavSafeArea = 56.0;
}

class AppMotion {
  AppMotion._();

  static const Duration instant = Duration(milliseconds: 50);
  static const Duration quick = Duration(milliseconds: 150);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration emphasis = Duration(milliseconds: 700);

  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve elasticOut = Curves.elasticOut;
}

class AppElevation {
  AppElevation._();

  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 3.0;
  static const double level3 = 6.0;
  static const double level4 = 8.0;
  static const double level5 = 12.0;
}

class AppBreakpoint {
  AppBreakpoint._();

  static const double compact = 360.0;
  static const double medium = 600.0;
  static const double expanded = 840.0;
}
