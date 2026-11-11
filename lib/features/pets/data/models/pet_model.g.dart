// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      species: json['species'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      breed: json['breed'] as String?,
      sex: json['sex'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      approximateAge: json['approximateAge'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      weightUnit: json['weightUnit'] as String? ?? 'kg',
      microchipNumber: json['microchipNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      localPhotoPath: json['localPhotoPath'] as String?,
      notes: json['notes'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'species': instance.species,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'breed': instance.breed,
      'sex': instance.sex,
      'birthDate': instance.birthDate?.toIso8601String(),
      'approximateAge': instance.approximateAge,
      'weight': instance.weight,
      'weightUnit': instance.weightUnit,
      'microchipNumber': instance.microchipNumber,
      'photoUrl': instance.photoUrl,
      'localPhotoPath': instance.localPhotoPath,
      'notes': instance.notes,
      'isArchived': instance.isArchived,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
