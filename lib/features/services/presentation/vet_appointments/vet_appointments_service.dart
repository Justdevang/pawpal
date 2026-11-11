// ignore_for_file: type=lint
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../../../../core/database/daos/appointment_dao.dart';
import '../../../../core/database/database.dart';
import '../../../../core/di/providers.dart';

/// Vet Appointments Service
class VetAppointmentsService {
  static const String serviceId = 'vet_appointments';
  static const String name = 'Vet Appointments';
  static const String description = 'Book & manage vet visits';
  static const String iconName = 'local_hospital';
  static const String route = '/services/vet_appointments';
  static const List<String> reminderTypes = ['appointment_reminder', 'appointment_followup'];
  static const int sortOrder = 1;

  final AppointmentDao _appointmentDao;
  // ignore: unused_field
  final AppDatabase _database;

  VetAppointmentsService(this._appointmentDao, this._database);

  /// Get appointments for a pet
  Future<List<Appointment>> getAppointments(int petId) async {
    return _appointmentDao.getAppointmentsByPetId(petId);
  }

  /// Watch appointments for a pet
  Stream<List<Appointment>> watchAppointments(int petId) {
    return _appointmentDao.watchAppointmentsByPetId(petId);
  }

  /// Get upcoming appointments
  Future<List<Appointment>> getUpcomingAppointments(int petId, DateTime until) async {
    return _appointmentDao.getUpcomingAppointments(petId, until);
  }

  /// Create appointment
  Future<Appointment> createAppointment(Appointment appointment) async {
    final id = await _appointmentDao.insertAppointment(
      appointment.toCompanion(false).copyWith(id: const Value.absent()),
    );
    final created = await _appointmentDao.getAppointmentById(id);
    if (created == null) throw Exception('Failed to create appointment');
    return created;
  }

  /// Update appointment
  Future<void> updateAppointment(Appointment appointment) async {
    await _appointmentDao.updateAppointment(appointment.toCompanion(false));
  }

  /// Delete appointment
  Future<void> deleteAppointment(int id) async {
    await _appointmentDao.softDeleteAppointment(id);
  }

  /// Get appointment by ID
  Future<Appointment?> getAppointment(int id) async {
    return _appointmentDao.getAppointmentById(id);
  }
}

/// Riverpod provider for VetAppointmentsService
final vetAppointmentsServiceProvider = Provider<VetAppointmentsService>((ref) {
  return VetAppointmentsService(
    ref.watch(appointmentDaoProvider),
    ref.watch(databaseProvider),
  );
});