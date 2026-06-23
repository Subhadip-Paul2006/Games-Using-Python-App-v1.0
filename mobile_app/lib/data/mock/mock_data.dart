import 'package:flutter/material.dart';
import '../../domain/models/game_model.dart';
import '../../domain/models/achievement_model.dart';
import '../../domain/models/user_profile.dart';
import '../../core/theme/app_colors.dart';

class MockData {
  MockData._();

  static final List<GameModel> games = [
    GameModel(
      id: 'snake',
      name: 'Snake',
      description: 'The classic Nokia game. Eat food, grow longer, avoid yourself!',
      category: 'Arcade',
      colorValue: AppColors.gameSnake.value,
      icon: '🐍',
      isFeatured: true,
      highScore: 2450,
      playCount: 42,
      lastPlayed: '2h ago',
    ),
    GameModel(
      id: 'block-drop',
      name: 'Block Drop',
      description: 'Stack blocks, clear lines. The puzzle that never gets old.',
      category: 'Puzzle',
      colorValue: AppColors.gameBlockDrop.value,
      icon: '🧱',
      highScore: 8900,
      playCount: 28,
      lastPlayed: '1d ago',
    ),
    GameModel(
      id: 'sky-hop',
      name: 'Sky Hop',
      description: 'Tap to fly through pipes. How far can you go?',
      category: 'Arcade',
      colorValue: AppColors.gameSkyHop.value,
      icon: '🐦',
      isFeatured: false,
      highScore: 87,
      playCount: 15,
      lastPlayed: '3d ago',
    ),
    GameModel(
      id: 'hangman',
      name: 'Hangman',
      description: 'Guess the word before the stick figure is complete.',
      category: 'Word',
      colorValue: AppColors.gameHangman.value,
      icon: '📝',
      highScore: 380,
      playCount: 19,
      lastPlayed: '5h ago',
    ),
    GameModel(
      id: 'mineSneeker',
      name: 'MineSneeker',
      description: 'Find the safe spots. Avoid the mines. Pure logic.',
      category: 'Strategy',
      colorValue: AppColors.gameMineSneeker.value,
      icon: '💣',
      highScore: 120,
      playCount: 8,
      lastPlayed: '1w ago',
    ),
    GameModel(
      id: 'tic-tac-toe',
      name: 'Tic Tac Toe',
      description: 'X or O? Outsmart your opponent in this timeless classic.',
      category: 'Strategy',
      colorValue: AppColors.gameTicTacToe.value,
      icon: '❌',
      highScore: 0,
      playCount: 35,
      lastPlayed: '30m ago',
    ),
    GameModel(
      id: 'rps',
      name: 'Rock Paper Scissors',
      description: 'Choose your weapon. Best of three wins!',
      category: 'Casual',
      colorValue: AppColors.gameRPS.value,
      icon: '✊',
      highScore: 12,
      playCount: 22,
      lastPlayed: '4h ago',
    ),
  ];

  static final List<AchievementModel> achievements = [
    AchievementModel(
      id: 'first_play',
      title: 'First Steps',
      description: 'Play your first game',
      icon: '🎮',
      isUnlocked: true,
      unlockedAt: '2026-06-20',
      colorValue: AppColors.primary.value,
    ),
    AchievementModel(
      id: 'snake_1000',
      title: 'Snake Charmer',
      description: 'Score 1000 in Snake',
      icon: '🐍',
      isUnlocked: true,
      unlockedAt: '2026-06-21',
      colorValue: AppColors.gameSnake.value,
    ),
    AchievementModel(
      id: 'block_clear',
      title: 'Line Clearer',
      description: 'Clear 10 lines in Block Drop',
      icon: '🧱',
      isUnlocked: false,
      colorValue: AppColors.gameBlockDrop.value,
    ),
    AchievementModel(
      id: 'streak_7',
      title: 'Week Warrior',
      description: '7-day play streak',
      icon: '🔥',
      isUnlocked: false,
      colorValue: AppColors.tertiary.value,
    ),
    AchievementModel(
      id: 'all_games',
      title: 'Explorer',
      description: 'Play all 7 games at least once',
      icon: '🗺️',
      isUnlocked: false,
      colorValue: AppColors.secondary.value,
    ),
    AchievementModel(
      id: 'hangman_streak',
      title: 'Wordsmith',
      description: 'Guess 5 words in a row',
      icon: '📝',
      isUnlocked: false,
      colorValue: AppColors.gameHangman.value,
    ),
    AchievementModel(
      id: 'mine_sweep',
      title: 'Bomb Squad',
      description: 'Clear a medium board in MineSneeker',
      icon: '💣',
      isUnlocked: false,
      colorValue: AppColors.gameMineSneeker.value,
    ),
    AchievementModel(
      id: 'rps_master',
      title: 'Mind Reader',
      description: 'Win 5 RPS rounds in a row',
      icon: '✊',
      isUnlocked: false,
      colorValue: AppColors.gameRPS.value,
    ),
  ];

  static final UserProfile profile = UserProfile(
    displayName: 'Player',
    avatar: '🦊',
    streak: 3,
    totalGames: 169,
    bestScore: 8900,
    achievementsCount: 2,
  );

  static List<GameModel> get recentlyPlayed =>
      games.where((g) => g.lastPlayed.isNotEmpty).toList()
        ..sort((a, b) => _sortLastPlayed(a.lastPlayed, b.lastPlayed));

  static int _sortLastPlayed(String a, String b) {
    final map = {'30m ago': 0, '1h ago': 1, '2h ago': 2, '3d ago': 3, '4h ago': 4, '5h ago': 5, '1d ago': 6, '1w ago': 7};
    return (map[a] ?? 99).compareTo(map[b] ?? 99);
  }
}
