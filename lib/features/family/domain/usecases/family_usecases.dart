// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/family_repository.dart';
import '../../domain/entities/family_member.dart';
import '../../../../core/errors/app_exceptions.dart';

class InviteFamilyMemberUseCase {
  final FamilyRepository repository;

  InviteFamilyMemberUseCase(this.repository);

  Future<Either<AppException, FamilyMember>> call(FamilyMember member) {
    return repository.inviteFamilyMember(member);
  }
}

class GetFamilyMembersUseCase {
  final FamilyRepository repository;

  GetFamilyMembersUseCase(this.repository);

  Future<Either<AppException, List<FamilyMember>>> call(int petId) {
    return repository.getFamilyMembersByPetId(petId);
  }
}

class WatchFamilyMembersUseCase {
  final FamilyRepository repository;

  WatchFamilyMembersUseCase(this.repository);

  Stream<Either<AppException, List<FamilyMember>>> call(int petId) {
    return repository.watchFamilyMembersByPetId(petId);
  }
}

class GetPendingInvitesUseCase {
  final FamilyRepository repository;

  GetPendingInvitesUseCase(this.repository);

  Future<Either<AppException, List<FamilyMember>>> call(String email) {
    return repository.getPendingInvitesByEmail(email);
  }
}

class UpdateFamilyMemberUseCase {
  final FamilyRepository repository;

  UpdateFamilyMemberUseCase(this.repository);

  Future<Either<AppException, FamilyMember>> call(FamilyMember member) {
    return repository.updateFamilyMember(member);
  }
}

class RemoveFamilyMemberUseCase {
  final FamilyRepository repository;

  RemoveFamilyMemberUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.removeFamilyMember(id);
  }
}

class AcceptInviteUseCase {
  final FamilyRepository repository;

  AcceptInviteUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.acceptInvite(id);
  }
}

class DeclineInviteUseCase {
  final FamilyRepository repository;

  DeclineInviteUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.declineInvite(id);
  }
}