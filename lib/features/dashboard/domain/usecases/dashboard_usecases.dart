// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/dashboard_data.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../features/pets/domain/repositories/pet_repository.dart';
import '../../../../features/pets/domain/entities/pet.dart';
import '../../../../features/vaccinations/domain/repositories/vaccination_repository.dart';
import '../../../../features/vaccinations/domain/entities/vaccination_record.dart';
import '../../../../features/medications/domain/repositories/medication_repository.dart';
import '../../../../features/medications/domain/entities/medication.dart';
import '../../../../features/reminders/domain/repositories/reminder_repository.dart';
import '../../../../features/reminders/domain/entities/reminder.dart';
import 'package:pawpal/core/extensions/extensions.dart';

class GetDashboardDataUseCase {
  final PetRepository _petRepository;
  final VaccinationRepository _vaccinationRepository;
  final MedicationRepository _medicationRepository;
  final ReminderRepository _reminderRepository;

  GetDashboardDataUseCase({
    required PetRepository petRepository,
    required VaccinationRepository vaccinationRepository,
    required MedicationRepository medicationRepository,
    required ReminderRepository reminderRepository,
  })  : _petRepository = petRepository,
        _vaccinationRepository = vaccinationRepository,
        _medicationRepository = medicationRepository,
        _reminderRepository = reminderRepository;

  Future<Either<AppException, DashboardDataEntity>> call(int userId, int selectedPetId) async {
    try {
      // Get all pets
      final petsResult = await _petRepository.getAllPets(userId);
      final pets = petsResult.fold((l) => <Pet>[], (r) => r);

      // Get today's tasks from reminders
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final todayEnd = todayStart.add(const Duration(days: 1));
      final weekEnd = todayStart.add(const Duration(days: 7));

      final remindersResult = await _reminderRepository.getRemindersByUserId(userId);
      final reminders = remindersResult.fold((l) => <Reminder>[], (r) => r);

      // Categorize tasks
      final todaysTasks = <TaskSummary>[];
      final overdueTasks = <TaskSummary>[];
      final upcomingTasks = <TaskSummary>[];

      for (final reminder in reminders) {
        if (!reminder.isEnabled) continue;

        final task = TaskSummary(
          id: reminder.id,
          type: reminder.type,
          title: reminder.title,
          petName: '', // Would be populated from pet lookup
          petId: reminder.petId,
          scheduledTime: reminder.nextTriggerAt,
          description: reminder.description,
          isCompleted: false,
          isOverdue: reminder.nextTriggerAt.isBefore(now),
        );

        if (reminder.nextTriggerAt.isBefore(now)) {
          overdueTasks.add(task);
        } else if (reminder.nextTriggerAt.isBefore(todayEnd)) {
          todaysTasks.add(task);
        } else if (reminder.nextTriggerAt.isBefore(weekEnd)) {
          upcomingTasks.add(task);
        }
      }

      // Get selected pet for health summary
      Pet? selectedPet;
      try {
        final petResult = await _petRepository.getPetById(selectedPetId);
        selectedPet = petResult.fold((l) => null, (r) => r);
      } catch (_) {}

      int activeMedications = 0;
      int upcomingVaccinations = 0;
      HealthSummary? healthSummary;

      if (selectedPet != null) {
        final weightResult = await _petRepository.getPetById(selectedPetId);
        final weight = weightResult.fold((l) => null, (r) => r?.weight);

        // Get latest vaccination
        String lastVetVisit = 'Never';
        try {
          final vaxResult = await _vaccinationRepository.getRecordsByPetId(selectedPetId);
          final vaxRecords = vaxResult.fold((l) => <VaccinationRecord>[], (r) => r);
          if (vaxRecords.isNotEmpty) {
            vaxRecords.sort((a, b) => b.dateGiven.compareTo(a.dateGiven));
            lastVetVisit = vaxRecords.first.dateGiven.formatDate();
          }
        } catch (_) {}

        // Get active medications count
        try {
          final medResult = await _medicationRepository.getMedicationsByPetId(selectedPetId, activeOnly: true);
          final meds = medResult.fold((l) => <Medication>[], (r) => r);
          activeMedications = meds.length;
        } catch (_) {}

        // Get upcoming vaccinations
        try {
          final vaxResult = await _vaccinationRepository.getUpcomingRecords(selectedPetId, weekEnd);
          final vaxRecords = vaxResult.fold((l) => <VaccinationRecord>[], (r) => r);
          upcomingVaccinations = vaxRecords.length;
        } catch (_) {}

        healthSummary = HealthSummary(
          petName: selectedPet.name,
          weight: weight != null ? '${weight.toStringAsFixed(1)} kg' : 'Unknown',
          healthStatus: 'Healthy', // Would be calculated
          lastVetVisit: lastVetVisit,
          petImageUrl: selectedPet.photoUrl,
          petLocalPath: selectedPet.localPhotoPath,
        );
      }

      // Build pet summaries
      final petSummaries = pets.map((p) => PetSummary(
        id: p.id,
        name: p.name,
        species: p.species,
        breed: p.breed,
        photoUrl: p.photoUrl,
        localPhotoPath: p.localPhotoPath,
        isSelected: p.id == selectedPetId,
      )).toList();

      return Right(DashboardDataEntity(
        pets: petSummaries,
        todaysTasks: todaysTasks,
        overdueTasks: overdueTasks,
        upcomingTasks: upcomingTasks,
        healthSummary: healthSummary,
        totalPets: pets.length,
        activeMedications: activeMedications,
        upcomingVaccinations: upcomingVaccinations,
        overdueItems: overdueTasks.length,
      ));
    } catch (e) {
      return Left(DatabaseException('Failed to load dashboard: $e', originalError: e));
    }
  }
}
