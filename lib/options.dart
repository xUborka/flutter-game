import 'package:json_annotation/json_annotation.dart';

part 'options.g.dart';

/// TODO : Document
@JsonSerializable()
class Options {
  /// TODO : Document
  bool enableMusic;

  /// TODO : Document
  bool enableSfx;

  /// TODO : Document
  Options() {
    enableMusic = true;
    enableSfx = true;
  }

  /// TODO : Document
  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  /// TODO : Document
  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  /// TODO : Document
  Options clone() {
    return Options.fromJson(toJson());
  }
}
