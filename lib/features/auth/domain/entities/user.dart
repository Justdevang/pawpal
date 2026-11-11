// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    @Default(false) bool isGuest,
    @Default('en') String preferredLanguage,
    @Default('metric') String units, // metric/imperial
    @Default(false) bool darkMode,
    @Default(true) bool notificationsEnabled,
    DateTime? quietHoursStart,
    DateTime? quietHoursEnd,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}