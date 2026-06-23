import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/discover/discover_screen.dart';
import '../../presentation/screens/game_detail/game_detail_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/achievements/achievements_screen.dart';
import '../../presentation/widgets/navigation/navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          final currentIndex = _getIndexFromLocation(state.uri.path);
          return AppShell(
            currentIndex: currentIndex,
            onNavChanged: (index) {
              final paths = ['/home', '/discover', '/achievements', '/profile'];
              if (index != currentIndex) {
                GoRouter.of(context).go(paths[index]);
              }
            },
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/discover',
            builder: (context, state) => const DiscoverScreen(),
          ),
          GoRoute(
            path: '/achievements',
            builder: (context, state) => const AchievementsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/game/:gameId',
        builder: (context, state) {
          final gameId = state.pathParameters['gameId']!;
          return GameDetailScreen(gameId: gameId);
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  static int _getIndexFromLocation(String location) {
    if (location.startsWith('/discover')) return 1;
    if (location.startsWith('/achievements')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}

class AppShell extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onNavChanged;
  final Widget child;

  const AppShell({
    super.key,
    required this.currentIndex,
    required this.onNavChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: RetroBottomNavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onNavChanged,
      ),
    );
  }
}
