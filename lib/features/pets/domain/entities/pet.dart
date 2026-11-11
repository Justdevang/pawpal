// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/extensions/extensions.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
abstract class Pet with _$Pet {
  const factory Pet({
    required int id,
    required int userId,
    required String name,
    required String species,
    String? breed,
    String? sex,
    DateTime? birthDate,
    String? approximateAge,
    double? weight,
    @Default('kg') String weightUnit,
    String? microchipNumber,
    String? photoUrl,
    String? localPhotoPath,
    String? notes,
    @Default(false) bool isArchived,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Pet;

  const Pet._();

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  // Helper getters
  int get ageInMonths {
    if (birthDate == null) return 0;
    final now = DateTime.now();
    return (now.difference(birthDate!).inDays / 30.44).floor();
  }

  String get formattedAge {
    if (birthDate == null) return approximateAge ?? 'Unknown';
    final months = ageInMonths;
    if (months < 12) return '$months month${months == 1 ? '' : 's'}';
    final years = months ~/ 12;
    final remainingMonths = months % 12;
    if (remainingMonths == 0) return '$years year${years == 1 ? '' : 's'}';
    return '$years year${years == 1 ? '' : 's'} $remainingMonths month${remainingMonths == 1 ? '' : 's'}';
  }

  String get formattedWeight {
    if (weight == null) return 'Unknown';
    return '${weight!.toStringAsFixed(1)} $weightUnit';
  }

  String get speciesDisplayName {
    switch (species) {
      case 'dog':
        return 'Dog';
      case 'cat':
        return 'Cat';
      case 'rabbit':
        return 'Rabbit';
      case 'hamster':
        return 'Hamster';
      case 'bird':
        return 'Bird';
      default:
        return species.capitalize();
    }
  }
}
