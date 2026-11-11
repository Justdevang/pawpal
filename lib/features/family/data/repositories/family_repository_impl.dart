// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' show Value;

import '../../domain/repositories/family_repository.dart';
import '../../domain/entities/family_member.dart';
import '../models/family_models.dart';
import '../models/family_models_extension.dart';
import '../../../../core/database/daos/family_member_dao.dart';
import '../../../../core/database/database.dart' as db;
import '../../../../core/errors/app_exceptions.dart';

class FamilyRepositoryImpl implements FamilyRepository {
  final FamilyMemberDao _familyMemberDao;
  // ignore: unused_field
  final db.AppDatabase _database;

  FamilyRepositoryImpl(this._familyMemberDao, this._database);

  @override
  Future<Either<AppException, List<FamilyMember>>> getFamilyMembersByPetId(int petId) async {
    try {
      final members = await _familyMemberDao.getFamilyMembersByPetId(petId);
      return Right(members.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get family members: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<FamilyMember>>> watchFamilyMembersByPetId(int petId) {
    try {
      return _familyMemberDao.watchFamilyMembersByPetId(petId).map((members) {
        return Right(members.map((m) => m.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch family members: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, List<FamilyMember>>> getPendingInvitesByEmail(String email) async {
    try {
      final members = await _familyMemberDao.getPendingInvitesByEmail(email);
      return Right(members.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get pending invites: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, FamilyMember?>> getFamilyMemberById(int id) async {
    try {
      final member = await _familyMemberDao.getFamilyMemberById(id);
      if (member == null) return const Right(null);
      return Right(member.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to get family member: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, FamilyMember>> inviteFamilyMember(FamilyMember member) async {
    try {
      final model = FamilyMemberModel.fromEntity(member);
      final id = await _familyMemberDao.insertFamilyMember(model.toCompanion(insert: true));
      final created = await _familyMemberDao.getFamilyMemberById(id);
      if (created == null) {
        return Left(DatabaseException('Failed to create invite'));
      }
      return Right(created.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to invite family member: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, FamilyMember>> updateFamilyMember(FamilyMember member) async {
    try {
      final model = FamilyMemberModel.fromEntity(member.copyWith(updatedAt: DateTime.now()));
      await _familyMemberDao.updateFamilyMember(model.toCompanion());
      final updated = await _familyMemberDao.getFamilyMemberById(member.id);
      if (updated == null) {
        return Left(DatabaseException('Failed to update family member'));
      }
      return Right(updated.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to update family member: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> removeFamilyMember(int id) async {
    try {
      await _familyMemberDao.deleteFamilyMember(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to remove family member: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> acceptInvite(int id) async {
    try {
      await _familyMemberDao.updateFamilyMember(
        db.FamilyMembersCompanion(
          id: Value(id),
          status: const Value('accepted'),
          respondedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to accept invite: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> declineInvite(int id) async {
    try {
      await _familyMemberDao.updateFamilyMember(
        db.FamilyMembersCompanion(
          id: Value(id),
          status: const Value('declined'),
          respondedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to decline invite: $e', originalError: e));
    }
  }
}