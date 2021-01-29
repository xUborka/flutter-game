import 'package:json_annotation/json_annotation.dart';
part 'options.g.dart';

@JsonSerializable()
class Options {
  bool enableMusic;
  bool enableSfx;
  Options() {
    enableMusic = true;
    enableSfx = true;
  }
  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
  Options clone() {
    return Options.fromJson(toJson());
  }
}
