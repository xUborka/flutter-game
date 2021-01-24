// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedData _$SavedDataFromJson(Map<String, dynamic> json) {
  return SavedData()
    ..options = json['options'] == null
        ? null
        : Options.fromJson(json['options'] as Map<String, dynamic>)
    ..stats = json['stats'] == null
        ? null
        : Stats.fromJson(json['stats'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SavedDataToJson(SavedData instance) => <String, dynamic>{
      'options': instance.options,
      'stats': instance.stats,
    };
