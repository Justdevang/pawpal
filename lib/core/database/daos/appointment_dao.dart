// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/appointments.dart';

part 'appointment_dao.g.dart';

@DriftAccessor(tables: [Appointments])
class AppointmentDao extends DatabaseAccessor<AppDatabase> with _$AppointmentDaoMixin {
  AppointmentDao(super.db);

  Future<List<Appointment>> getAppointmentsByPetId(int petId) {
    return (select(appointments)
          ..where((a) => a.petId.equals(petId) & a.deletedAt.isNull())
          ..orderBy([(a) => OrderingTerm.asc(a.appointmentDate)]))
        .get();
  }

  Stream<List<Appointment>> watchAppointmentsByPetId(int petId) {
    return (select(appointments)
          ..where((a) => a.petId.equals(petId) & a.deletedAt.isNull())
          ..orderBy([(a) => OrderingTerm.asc(a.appointmentDate)]))
        .watch();
  }

  Future<List<Appointment>> getUpcomingAppointments(int petId, DateTime until) {
    return (select(appointments)
          ..where((a) =>
              a.petId.equals(petId) &
              a.deletedAt.isNull() &
              a.appointmentDate.isBiggerOrEqualValue(DateTime.now()) &
              a.appointmentDate.isSmallerOrEqualValue(until))
          ..orderBy([(a) => OrderingTerm.asc(a.appointmentDate)]))
        .get();
  }

  Future<Appointment?> getAppointmentById(int id) {
    return (select(appointments)..where((a) => a.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertAppointment(AppointmentsCompanion appointment) {
    return into(appointments).insert(appointment);
  }

  Future<bool> updateAppointment(AppointmentsCompanion appointment) {
    return update(appointments).replace(appointment);
  }

  Future<int> softDeleteAppointment(int id) {
    return (update(appointments)..where((a) => a.id.equals(id)))
        .write(AppointmentsCompanion(deletedAt: Value(DateTime.now())));
  }
}