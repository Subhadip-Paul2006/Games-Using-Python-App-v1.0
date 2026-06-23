class AchievementModel {
  final String id;
  final String title;
  final String description;
  final String icon;
  final bool isUnlocked;
  final String? unlockedAt;
  final int colorValue;

  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.isUnlocked = false,
    this.unlockedAt,
    required this.colorValue,
  });

  AchievementModel copyWith({
    bool? isUnlocked,
    String? unlockedAt,
  }) {
    return AchievementModel(
      id: id,
      title: title,
      description: description,
      icon: icon,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      colorValue: colorValue,
    );
  }
}
