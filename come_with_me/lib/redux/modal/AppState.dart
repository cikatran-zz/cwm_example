import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'AppState.g.dart';

@immutable
@JsonSerializable()
class AppState {
  final String temp;

  AppState({
    this.temp = "",
  });

  factory AppState.initial() {
    return AppState(temp: "");
  }

  AppState copyWith({
    String temp,
  }) {
    return AppState(
      temp: temp ?? this.temp,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && runtimeType == other.runtimeType;

  @override
  String toString() {
    return 'AppState{temp: $temp}';
  }

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
