// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/family_repository.dart';
import '../../domain/usecases/family_usecases.dart';
import '../../domain/entities/family_member.dart';
import '../../data/repositories/family_repository_impl.dart';
import '../../../../core/di/providers.dart';

part 'family_providers.g.dart';

@riverpod
FamilyRepository familyRepository(Ref ref) {
  return FamilyRepositoryImpl(
    ref.watch(familyMemberDaoProvider),
    ref.watch(databaseProvider),
  );
}

@riverpod
InviteFamilyMemberUseCase inviteFamilyMemberUseCase(Ref ref) {
  return InviteFamilyMemberUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
GetFamilyMembersUseCase getFamilyMembersUseCase(Ref ref) {
  return GetFamilyMembersUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
WatchFamilyMembersUseCase watchFamilyMembersUseCase(Ref ref) {
  return WatchFamilyMembersUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
GetPendingInvitesUseCase getPendingInvitesUseCase(Ref ref) {
  return GetPendingInvitesUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
UpdateFamilyMemberUseCase updateFamilyMemberUseCase(Ref ref) {
  return UpdateFamilyMemberUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
RemoveFamilyMemberUseCase removeFamilyMemberUseCase(Ref ref) {
  return RemoveFamilyMemberUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
AcceptInviteUseCase acceptInviteUseCase(Ref ref) {
  return AcceptInviteUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
DeclineInviteUseCase declineInviteUseCase(Ref ref) {
  return DeclineInviteUseCase(ref.watch(familyRepositoryProvider));
}

@riverpod
Stream<List<FamilyMember>> familyMembersStream(Ref ref, int petId) {
  final useCase = ref.watch(watchFamilyMembersUseCaseProvider);
  return useCase(petId).map((result) => result.fold((l) => <FamilyMember>[], (r) => r));
}

@riverpod
Future<List<FamilyMember>> pendingInvites(Ref ref, String email) async {
  final useCase = ref.watch(getPendingInvitesUseCaseProvider);
  final result = await useCase(email);
  return result.fold((l) => <FamilyMember>[], (r) => r);
}