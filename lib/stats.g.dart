// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) {
  return Score(
    (json['distance'] as num)?.toDouble(),
    json['points'] as int,
  );
}

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'distance': instance.distance,
      'points': instance.points,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats()
    ..scores = (json['scores'] as List)
        ?.map(
            (e) => e == null ? null : Score.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..maxDistance = (json['maxDistance'] as num)?.toDouble()
    ..totalDistance = (json['totalDistance'] as num)?.toDouble()
    ..maxPoints = json['maxPoints'] as int
    ..totalPoints = json['totalPoints'] as int;
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'scores': instance.scores,
      'maxDistance': instance.maxDistance,
      'totalDistance': instance.totalDistance,
      'maxPoints': instance.maxPoints,
      'totalPoints': instance.totalPoints,
    };
