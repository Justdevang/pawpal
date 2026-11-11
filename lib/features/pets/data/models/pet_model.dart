import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pet.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
abstract class PetModel with _$PetModel {
  const factory PetModel({
    required final int id,
    required final int userId,
    required final String name,
    required final String species,
    required final DateTime createdAt, required final DateTime updatedAt, final String? breed,
    final String? sex,
    final DateTime? birthDate,
    final String? approximateAge,
    final double? weight,
    @Default('kg') final String weightUnit,
    final String? microchipNumber,
    final String? photoUrl,
    final String? localPhotoPath,
    final String? notes,
    @Default(false) final bool isArchived,
    final DateTime? deletedAt,
  }) = _PetModel;

  const PetModel._();

  factory PetModel.fromJson(final Map<String, dynamic> json) => _$PetModelFromJson(json);

  factory PetModel.fromEntity(final Pet pet) => PetModel(
      id: pet.id,
      userId: pet.userId,
      name: pet.name,
      species: pet.species,
      breed: pet.breed,
      sex: pet.sex,
      birthDate: pet.birthDate,
      approximateAge: pet.approximateAge,
      weight: pet.weight,
      weightUnit: pet.weightUnit,
      microchipNumber: pet.microchipNumber,
      photoUrl: pet.photoUrl,
      localPhotoPath: pet.localPhotoPath,
      notes: pet.notes,
      isArchived: pet.isArchived,
      createdAt: pet.createdAt,
      updatedAt: pet.updatedAt,
      deletedAt: pet.deletedAt,
    );

  Pet toEntity() => Pet(
      id: id,
      userId: userId,
      name: name,
      species: species,
      breed: breed,
      sex: sex,
      birthDate: birthDate,
      approximateAge: approximateAge,
      weight: weight,
      weightUnit: weightUnit,
      microchipNumber: microchipNumber,
      photoUrl: photoUrl,
      localPhotoPath: localPhotoPath,
      notes: notes,
      isArchived: isArchived,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
}