import 'dart:convert';
import 'package:flutter_game/stats.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'options.dart';
part 'data.g.dart';

@JsonSerializable()
class SavedData {
  Options options;
  Stats stats;
  SavedData() {
    options = Options();
    stats = Stats();
  }
  factory SavedData.fromJson(Map<String, dynamic> json) => _$SavedDataFromJson(json);
  Map<String, dynamic> toJson() => _$SavedDataToJson(this);
  static SavedData merge(SavedData s1, SavedData s2) {
    return SavedData()
      ..options = s1.options ?? s2.options
      ..stats = Stats.merge(s1.stats, s2.stats);
  }
}

class Data {
  static const SAVE_NAME = 'shooterGame.data.v3';

  static SavedData _data;

  static Options currentOptions;
  static bool pristine = true;
  static bool isSaving = false;
  static bool hasOpened = false;
  static Options get options => _data.options ??= Options();

  static set options(Options options) => _data.options = options ?? Options();
  static Stats get stats => _data.stats ??= Stats();

  static Future save() async {
    if (isSaving) {
      print('will save in a while!');
      return Future.delayed(const Duration(seconds: 3)).then((_) => save());
    }
    isSaving = true;
    pristine = false;
    final data = json.encode(_data.toJson());
    final result = await _saveInternal(data);
    isSaving = false;
    return result;
  }

  static Future<Object> _saveInternal(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SAVE_NAME, data);
  }

  static Future loadLocalSoftData() async {
    pristine = true;
    _data = await Data.fetch(true);
  }

  static Future<SavedData> fetch(bool createNew) async {
    final loaded = await _doFetch(createNew);
    return loaded;
  }

  static Future<SavedData> _doFetch(bool createNew) async {
    return _fetchFromSharedPreferences(createNew);
  }

  static Future<SavedData> _fetchFromSharedPreferences(bool createNew) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(SAVE_NAME);
    if (jsonStr == null) {
      return createNew ? SavedData() : null;
    }
    return SavedData.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
  }
}
