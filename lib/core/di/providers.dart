// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/database.dart';
import '../database/daos/user_dao.dart';
import '../database/daos/pet_dao.dart';
import '../database/daos/vaccine_dao.dart';
import '../database/daos/vaccination_record_dao.dart';
import '../database/daos/medication_dao.dart';
import '../database/daos/dose_schedule_dao.dart';
import '../database/daos/dose_log_dao.dart';
import '../database/daos/reminder_dao.dart';
import '../database/daos/appointment_dao.dart';
import '../database/daos/weight_entry_dao.dart';
import '../database/daos/document_dao.dart';
import '../database/daos/family_member_dao.dart';
import '../database/daos/service_config_dao.dart';

part 'providers.g.dart';

@riverpod
AppDatabase database(Ref ref) {
  return AppDatabase();
}

@riverpod
UserDao userDao(Ref ref) {
  return UserDao(ref.watch(databaseProvider));
}

@riverpod
PetDao petDao(Ref ref) {
  return PetDao(ref.watch(databaseProvider));
}

@riverpod
VaccineDao vaccineDao(Ref ref) {
  return VaccineDao(ref.watch(databaseProvider));
}

@riverpod
VaccinationRecordDao vaccinationRecordDao(Ref ref) {
  return VaccinationRecordDao(ref.watch(databaseProvider));
}

@riverpod
MedicationDao medicationDao(Ref ref) {
  return MedicationDao(ref.watch(databaseProvider));
}

@riverpod
DoseScheduleDao doseScheduleDao(Ref ref) {
  return DoseScheduleDao(ref.watch(databaseProvider));
}

@riverpod
DoseLogDao doseLogDao(Ref ref) {
  return DoseLogDao(ref.watch(databaseProvider));
}

@riverpod
ReminderDao reminderDao(Ref ref) {
  return ReminderDao(ref.watch(databaseProvider));
}

@riverpod
AppointmentDao appointmentDao(Ref ref) {
  return AppointmentDao(ref.watch(databaseProvider));
}

@riverpod
WeightEntryDao weightEntryDao(Ref ref) {
  return WeightEntryDao(ref.watch(databaseProvider));
}

@riverpod
DocumentDao documentDao(Ref ref) {
  return DocumentDao(ref.watch(databaseProvider));
}

@riverpod
FamilyMemberDao familyMemberDao(Ref ref) {
  return FamilyMemberDao(ref.watch(databaseProvider));
}

@riverpod
ServiceConfigDao serviceConfigDao(Ref ref) {
  return ServiceConfigDao(ref.watch(databaseProvider));
}