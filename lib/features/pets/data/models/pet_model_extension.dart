import 'package:drift/drift.dart';
import '../../../../core/database/database.dart' as db;
import '../../domain/entities/pet.dart' as domain;
import 'pet_model.dart';

extension PetModelCompanionX on PetModel {
  db.PetsCompanion toCompanion({final bool insert = false}) => db.PetsCompanion(
      id: insert ? const Value.absent() : Value(id),
      userId: Value(userId),
      name: Value(name),
      species: Value(species),
      breed: Value(breed),
      sex: Value(sex),
      birthDate: Value(birthDate),
      approximateAge: Value(approximateAge),
      weight: Value(weight),
      weightUnit: Value(weightUnit),
      microchipNumber: Value(microchipNumber),
      photoUrl: Value(photoUrl),
      localPhotoPath: Value(localPhotoPath),
      notes: Value(notes),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
}

extension DbPetX on db.Pet {
  domain.Pet toEntity() => domain.Pet(
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
