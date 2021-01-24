import 'dart:math' as math;

import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

/// TODO : Document
@JsonSerializable()
class Score {
  /// TODO : Document
  double distance;

  /// TODO : Document
  int points;

  /// TODO : Document
  Score(this.distance, this.points);

  /// TODO : Document
  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  /// TODO : Document
  Map<String, dynamic> toJson() => _$ScoreToJson(this);

  /// TODO : Document
  String toText() =>
      'Scored ${distance.toStringAsFixed(2)} meters earning $points points.';
}

/// TODO : Document
@JsonSerializable()
class Stats {
  /// TODO : Document
  static const MAX_SCORES = 10;

  /// TODO : Document
  static const MAX_TRIES = 3;

  /// TODO : Document
  List<Score> scores;

  /// TODO : Document
  double maxDistance;

  /// TODO : Document
  double totalDistance;

  /// TODO : Document
  int maxPoints;

  /// TODO : Document
  int totalPoints;

  /// TODO : Document
  Stats() {
    scores = [];
    maxDistance = 0;
    totalDistance = 0;
    maxPoints = 0;
    totalPoints = 0;
  }

  /// TODO : Document
  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  /// TODO : Document
  Map<String, dynamic> toJson() => _$StatsToJson(this);

  /// TODO : Document
  List<String> statsList() {
    return [
      'Max Distance (m): ${maxDistance.toStringAsFixed(2)}',
      'Total Distance (m): ${totalDistance.toStringAsFixed(2)}',
      'Max Points: $maxPoints',
      'Total Points: $totalPoints',
    ];
  }

  /// TODO : Document
  static List<T> normalize<T>(List<T> scores) =>
      scores.sublist(0, MAX_SCORES.clamp(0, scores.length) as int);

  /// TODO : Document
  static Stats merge(Stats stats1, Stats stats2) {
    return Stats()
      ..scores = normalize((<Score>{}
            ..addAll(stats1.scores)
            ..addAll(stats2.scores))
          .toList()
          .cast<Score>())
      ..maxDistance = math.max(stats1.maxDistance, stats2.maxDistance)
      ..totalDistance = math.max(stats1.totalDistance, stats2.totalDistance)
      ..maxPoints = math.max(stats1.maxPoints, stats2.maxPoints)
      ..totalPoints = math.max(stats1.totalPoints, stats2.totalPoints);
  }
}
