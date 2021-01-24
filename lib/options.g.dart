// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return Options()
    ..enableMusic = json['enableMusic'] as bool
    ..enableSfx = json['enableSfx'] as bool;
}

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'enableMusic': instance.enableMusic,
      'enableSfx': instance.enableSfx,
    };
