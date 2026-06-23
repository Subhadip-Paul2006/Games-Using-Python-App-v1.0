import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/mock/mock_data.dart';
import '../../widgets/list/game_card.dart';
import '../../widgets/display/display.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final achievements = MockData.achievements;
    final unlockedCount =
        achievements.where((a) => a.isUnlocked).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.achievements),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.08),
                    AppColors.secondary.withValues(alpha: 0.04),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.emoji_events,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$unlockedCount / ${achievements.length}',
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Achievements Unlocked',
                          style: TextStyle(
                            fontSize: 14,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RetroProgressBar(
                          progress: unlockedCount / achievements.length,
                          activeColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Unlocked',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            ...achievements
                .where((a) => a.isUnlocked)
                .map((a) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AchievementBadge(
                        title: a.title,
                        description: a.description,
                        icon: a.icon,
                        isUnlocked: a.isUnlocked,
                        color: Color(a.colorValue),
                      ),
                    )),
            const SizedBox(height: 24),
            Text(
              'Locked',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            ...achievements
                .where((a) => !a.isUnlocked)
                .map((a) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AchievementBadge(
                        title: a.title,
                        description: a.description,
                        icon: a.icon,
                        isUnlocked: a.isUnlocked,
                        color: Color(a.colorValue),
                      ),
                    )),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
