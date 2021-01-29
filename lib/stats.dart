import 'dart:math' as math;
import 'package:json_annotation/json_annotation.dart';
part 'stats.g.dart';

/// TODO : Document
@JsonSerializable()
class Score {
  /// TODO : Document
  double distance;
  int points;
  Score(this.distance, this.points);
  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreToJson(this);
  String toText() =>
      'Scored ${distance.toStringAsFixed(2)} meters earning $points points.';
}

/// TODO : Document
@JsonSerializable()
class Stats {
  /// TODO : Document
  static const MAX_SCORES = 10;
  static const MAX_TRIES = 3;
  List<Score> scores;
  double maxDistance;
  double totalDistance;
  int maxPoints;
  int totalPoints;
  Stats() {
    scores = [];
    maxDistance = 0;
    totalDistance = 0;
    maxPoints = 0;
    totalPoints = 0;
  }
  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
  List<String> statsList() {
    return [
      'Max Distance (m): ${maxDistance.toStringAsFixed(2)}',
      'Total Distance (m): ${totalDistance.toStringAsFixed(2)}',
      'Max Points: $maxPoints',
      'Total Points: $totalPoints',
    ];
  }
  static List<T> normalize<T>(List<T> scores) =>
      scores.sublist(0, MAX_SCORES.clamp(0, scores.length) as int);
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
