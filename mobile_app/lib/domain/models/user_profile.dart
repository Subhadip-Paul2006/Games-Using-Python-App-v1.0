class UserProfile {
  final String displayName;
  final String avatar;
  final int streak;
  final int totalGames;
  final int bestScore;
  final int achievementsCount;

  const UserProfile({
    this.displayName = 'Player',
    this.avatar = '🦊',
    this.streak = 0,
    this.totalGames = 0,
    this.bestScore = 0,
    this.achievementsCount = 0,
  });

  UserProfile copyWith({
    String? displayName,
    String? avatar,
    int? streak,
    int? totalGames,
    int? bestScore,
    int? achievementsCount,
  }) {
    return UserProfile(
      displayName: displayName ?? this.displayName,
      avatar: avatar ?? this.avatar,
      streak: streak ?? this.streak,
      totalGames: totalGames ?? this.totalGames,
      bestScore: bestScore ?? this.bestScore,
      achievementsCount: achievementsCount ?? this.achievementsCount,
    );
  }
}
