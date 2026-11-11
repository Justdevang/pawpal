import 'package:drift/drift.dart';

import 'connection/connection.dart' as conn;
import 'daos/appointment_dao.dart';
import 'daos/document_dao.dart';
import 'daos/dose_log_dao.dart';
import 'daos/dose_schedule_dao.dart';
import 'daos/family_member_dao.dart';
import 'daos/medication_dao.dart';
import 'daos/pet_dao.dart';
import 'daos/reminder_dao.dart';
import 'daos/service_config_dao.dart';
import 'daos/user_dao.dart';
import 'daos/vaccination_record_dao.dart';
import 'daos/vaccine_dao.dart';
import 'daos/weight_entry_dao.dart';
import 'tables/appointments.dart';
import 'tables/documents.dart';
import 'tables/dose_logs.dart';
import 'tables/dose_schedules.dart';
import 'tables/family_members.dart';
import 'tables/medications.dart';
import 'tables/pets.dart';
import 'tables/reminders.dart';
import 'tables/service_configs.dart';
import 'tables/users.dart';
import 'tables/vaccination_records.dart';
import 'tables/vaccines.dart';
import 'tables/weight_entries.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: <Type>[
    Users,
    Pets,
    Vaccines,
    VaccinationRecords,
    Medications,
    DoseSchedules,
    DoseLogs,
    Reminders,
    Appointments,
    WeightEntries,
    Documents,
    FamilyMembers,
    ServiceConfigs,
  ],
  daos: <Type>[
    UserDao,
    PetDao,
    VaccineDao,
    VaccinationRecordDao,
    MedicationDao,
    DoseScheduleDao,
    DoseLogDao,
    ReminderDao,
    AppointmentDao,
    WeightEntryDao,
    DocumentDao,
    FamilyMemberDao,
    ServiceConfigDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([final QueryExecutor? executor]) : super(executor ?? conn.openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (final Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (final Migrator m, final int from, final int to) async {
          // Handle migrations here
        },
        beforeOpen: (details) async {
          final count = await customSelect('SELECT COUNT(*) AS c FROM vaccines').getSingle();
          if ((count.data['c'] as int? ?? 0) == 0) {
            final defaultVaccines = [
              VaccinesCompanion.insert(name: 'Rabies', species: 'dog', isCore: const Value(true), description: const Value('Core rabies vaccine for dogs and cats')),
              VaccinesCompanion.insert(name: 'DHPP', species: 'dog', isCore: const Value(true), description: const Value('Distemper, Hepatitis, Parvovirus, Parainfluenza')),
              VaccinesCompanion.insert(name: 'Bordetella', species: 'dog', isCore: const Value(false), description: const Value('Kennel cough prevention')),
              VaccinesCompanion.insert(name: 'Leptospirosis', species: 'dog', isCore: const Value(false), description: const Value('Protects against bacterial infection')),
              VaccinesCompanion.insert(name: 'Lyme', species: 'dog', isCore: const Value(false), description: const Value('Tick-borne Lyme disease protection')),
              VaccinesCompanion.insert(name: 'FVRCP', species: 'cat', isCore: const Value(true), description: const Value('Feline Viral Rhinotracheitis, Calicivirus, Panleukopenia')),
              VaccinesCompanion.insert(name: 'FeLV', species: 'cat', isCore: const Value(true), description: const Value('Feline Leukemia Virus')),
            ];
            await batch((b) => b.insertAll(vaccines, defaultVaccines));
          }
        },
      );
}