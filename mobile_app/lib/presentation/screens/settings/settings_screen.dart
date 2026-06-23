import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Appearance',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            title: const Text(AppStrings.darkMode),
            subtitle: Text(
              isDark ? 'Dark theme active' : 'Light theme active',
              style: TextStyle(
                fontSize: 12,
                color: scheme.onSurfaceVariant,
              ),
            ),
            secondary: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: scheme.onSurfaceVariant,
            ),
            value: isDark,
            onChanged: (val) => ref.read(themeModeProvider.notifier).setDark(val),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const Divider(),
          Text(
            'General',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(AppStrings.about),
            subtitle: Text(
              '${AppStrings.appName} v1.0.0',
              style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
            ),
            trailing: Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text(AppStrings.help),
            trailing: Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text(AppStrings.privacy),
            trailing: Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {},
          ),
          const Divider(),
          Text(
            'Gameplay',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            title: const Text('Sound Effects'),
            subtitle: Text(
              'Toggle in-game sounds',
              style: TextStyle(
                fontSize: 12,
                color: scheme.onSurfaceVariant,
              ),
            ),
            secondary: const Icon(Icons.volume_up_outlined),
            value: true,
            onChanged: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SwitchListTile.adaptive(
            title: const Text('Vibration'),
            subtitle: Text(
              'Haptic feedback on taps',
              style: TextStyle(
                fontSize: 12,
                color: scheme.onSurfaceVariant,
              ),
            ),
            secondary: const Icon(Icons.vibration),
            value: true,
            onChanged: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '${AppStrings.appName} — 90s Retro Gaming',
            style: TextStyle(
              fontSize: 12,
              color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
