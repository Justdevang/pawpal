// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/family_member.dart';
import '../../../../core/errors/app_exceptions.dart';

abstract class FamilyRepository {
  Future<Either<AppException, List<FamilyMember>>> getFamilyMembersByPetId(int petId);
  Stream<Either<AppException, List<FamilyMember>>> watchFamilyMembersByPetId(int petId);
  Future<Either<AppException, List<FamilyMember>>> getPendingInvitesByEmail(String email);
  Future<Either<AppException, FamilyMember?>> getFamilyMemberById(int id);
  Future<Either<AppException, FamilyMember>> inviteFamilyMember(FamilyMember member);
  Future<Either<AppException, FamilyMember>> updateFamilyMember(FamilyMember member);
  Future<Either<AppException, void>> removeFamilyMember(int id);
  Future<Either<AppException, void>> acceptInvite(int id);
  Future<Either<AppException, void>> declineInvite(int id);
}