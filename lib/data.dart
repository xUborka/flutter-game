import 'package:flutter_game/stats.dart';
import 'package:json_annotation/json_annotation.dart';

import 'options.dart';

part 'data.g.dart';

/// TODO : Document
@JsonSerializable()
class SavedData {
  /// TODO : Document
  Options options;

  /// TODO : Document
  Stats stats;

  /// TODO : Document
  SavedData() {
    options = Options();
    stats = Stats();
  }

  /// TODO : Document
  factory SavedData.fromJson(Map<String, dynamic> json) =>
      _$SavedDataFromJson(json);

  /// TODO : Document
  Map<String, dynamic> toJson() => _$SavedDataToJson(this);

  /// TODO : Document
  static SavedData merge(SavedData s1, SavedData s2) {
    return SavedData()
      ..options = s1.options ?? s2.options
      ..stats = Stats.merge(s1.stats, s2.stats);
  }
}

/// TODO : Document
class Data {
  /// TODO : Document
  static const SAVE_NAME = 'shooterGame.data.v3';

  static SavedData _data;

  /// TODO : Document
  static Options get options => _data.options ??= Options();

  static set options(Options options) => _data.options = options ?? Options();

  /// TODO : Document
  static Stats get stats => _data.stats ??= Stats();
}
