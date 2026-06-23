class GameModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final int colorValue;
  final String icon;
  final bool isFeatured;
  final int highScore;
  final int playCount;
  final String lastPlayed;

  const GameModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.colorValue,
    required this.icon,
    this.isFeatured = false,
    this.highScore = 0,
    this.playCount = 0,
    this.lastPlayed = '',
  });

  GameModel copyWith({
    int? highScore,
    int? playCount,
    String? lastPlayed,
  }) {
    return GameModel(
      id: id,
      name: name,
      description: description,
      category: category,
      colorValue: colorValue,
      icon: icon,
      isFeatured: isFeatured,
      highScore: highScore ?? this.highScore,
      playCount: playCount ?? this.playCount,
      lastPlayed: lastPlayed ?? this.lastPlayed,
    );
  }
}
