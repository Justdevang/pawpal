// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/vet_appointments/vet_appointments_service.dart';
import '../../presentation/weight_tracker/weight_tracker_service.dart';

part 'services_providers.g.dart';

@riverpod
VetAppointmentsService vetAppointmentsService(Ref ref) {
  return ref.watch(vetAppointmentsServiceProvider);
}

@riverpod
WeightTrackerService weightTrackerService(Ref ref) {
  return ref.watch(weightTrackerServiceProvider);
}