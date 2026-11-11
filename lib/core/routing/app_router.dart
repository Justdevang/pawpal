// ignore_for_file: type=lint
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';


import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/guest_mode_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/pets/presentation/pages/pet_list_page.dart';
import '../../features/pets/presentation/pages/add_edit_pet_page.dart';
import '../../features/pets/presentation/pages/pet_profile_page.dart';
import '../../features/vaccinations/presentation/pages/vaccination_list_page.dart';
import '../../features/vaccinations/presentation/pages/add_vaccination_page.dart';
import '../../features/vaccinations/presentation/pages/vaccination_detail_page.dart';
import '../../features/medications/presentation/pages/medication_list_page.dart';
import '../../features/medications/presentation/pages/add_medication_page.dart';
import '../../features/medications/presentation/pages/medication_detail_page.dart';
import '../../features/medications/presentation/pages/medication_edit_page.dart';
import '../../features/reminders/presentation/pages/reminder_list_page.dart';
import '../../features/reminders/presentation/pages/reminder_detail_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/security_page.dart';
import '../../features/settings/presentation/pages/linked_accounts_page.dart';
import '../../features/settings/presentation/pages/quiet_hours_page.dart';
import '../../features/settings/presentation/pages/reminder_times_page.dart';
import '../../features/settings/presentation/pages/language_page.dart';
import '../../features/settings/presentation/pages/units_page.dart';
import '../../features/settings/presentation/pages/backup_page.dart';
import '../../features/settings/presentation/pages/dark_mode_page.dart';
import '../../features/settings/presentation/pages/change_password_page.dart';
import '../../features/services/presentation/pages/services_page.dart';
import '../../features/services/presentation/vet_appointments/vet_appointments_page.dart';
import '../../features/services/presentation/vet_appointments/vet_appointment_edit_page.dart';
import '../../features/services/presentation/weight_tracker/weight_tracker_page.dart';
import '../../features/services/presentation/weight_tracker/weight_entry_edit_page.dart';
import '../../features/services/presentation/grooming/grooming_page.dart';
import '../../features/services/presentation/deworming/deworming_page.dart';
import '../../features/services/presentation/feeding/feeding_page.dart';
import '../../features/services/presentation/medical_records/medical_records_page.dart';
import '../../features/services/presentation/lost_pet/lost_pet_page.dart';
import '../../features/services/presentation/expenses/expenses_page.dart';
import '../../features/family/presentation/pages/family_page.dart';
import '../../core/widgets/pawly_main_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isLoggedIn = authState.hasValue && authState.value != null;
      final location = state.matchedLocation;
      final isOnboarding = location.startsWith('/onboarding');
      final isGuestPage = location.startsWith('/guest');
      final isAuth = location.startsWith('/login') ||
          location.startsWith('/register') ||
          isGuestPage;
      final isAddPet = location.startsWith('/pets/add');

      // If not logged in and not on auth/onboarding/addPet, redirect to onboarding
      if (!isLoggedIn && !isOnboarding && !isAuth && !isAddPet) {
        return '/onboarding';
      }

      // If logged in and on guest page, route directly to create a pet profile
      if (isLoggedIn && isGuestPage) {
        return '/pets/add';
      }

      // If logged in and on other auth/onboarding pages, redirect to home
      if (isLoggedIn && (isOnboarding || isAuth)) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/guest',
        builder: (context, state) => const GuestModePage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/pets',
            builder: (context, state) => const PetListPage(),
          ),
          GoRoute(
            path: '/pets/add',
            builder: (context, state) => const AddEditPetPage(),
          ),
          GoRoute(
            path: '/pets/:petId',
            builder: (context, state) => PetProfilePage(petId: int.parse(state.pathParameters['petId']!)),
          ),
          GoRoute(
            path: '/pets/:petId/edit',
            builder: (context, state) => AddEditPetPage(petId: int.parse(state.pathParameters['petId']!)),
          ),
          GoRoute(
            path: '/vaccinations',
            builder: (context, state) => const VaccinationListPage(),
          ),
          GoRoute(
            path: '/vaccinations/add',
            builder: (context, state) => const AddVaccinationPage(),
          ),
          GoRoute(
            path: '/vaccinations/:recordId',
            builder: (context, state) => VaccinationDetailPage(recordId: int.parse(state.pathParameters['recordId']!)),
          ),
          GoRoute(
            path: '/vaccinations/:recordId/edit',
            builder: (context, state) => AddVaccinationPage(recordId: int.parse(state.pathParameters['recordId']!)),
          ),
          GoRoute(
            path: '/medications',
            builder: (context, state) => const MedicationListPage(),
          ),
          GoRoute(
            path: '/medications/add',
            builder: (context, state) => const AddMedicationPage(),
          ),
          GoRoute(
            path: '/medications/:medicationId',
            builder: (context, state) => MedicationDetailPage(medicationId: int.parse(state.pathParameters['medicationId']!)),
          ),
          GoRoute(
            path: '/medications/:medicationId/edit',
            builder: (context, state) => MedicationEditPage(medicationId: int.parse(state.pathParameters['medicationId']!)),
          ),
          GoRoute(
            path: '/reminders',
            builder: (context, state) => const ReminderListPage(),
          ),
          GoRoute(
            path: '/reminders/:reminderId',
            builder: (context, state) => ReminderDetailPage(reminderId: int.parse(state.pathParameters['reminderId']!)),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => const ServicesPage(),
          ),
          GoRoute(
            path: '/services/vet_appointments',
            builder: (context, state) => const VetAppointmentsPage(),
          ),
          GoRoute(
            path: '/services/vet_appointments/add',
            builder: (context, state) => const VetAppointmentEditPage(),
          ),
          GoRoute(
            path: '/services/vet_appointments/:appointmentId',
            builder: (context, state) => VetAppointmentEditPage(appointmentId: int.parse(state.pathParameters['appointmentId']!)),
          ),
          GoRoute(
            path: '/services/weight_tracker',
            builder: (context, state) => const WeightTrackerPage(),
          ),
          GoRoute(
            path: '/services/weight_tracker/add',
            builder: (context, state) => const WeightEntryEditPage(),
          ),
          GoRoute(
            path: '/services/weight_tracker/:entryId',
            builder: (context, state) => WeightEntryEditPage(entryId: int.parse(state.pathParameters['entryId']!)),
          ),
          GoRoute(
            path: '/services/grooming',
            builder: (context, state) => const GroomingPage(),
          ),
          GoRoute(
            path: '/services/deworming',
            builder: (context, state) => const DewormingPage(),
          ),
          GoRoute(
            path: '/services/feeding',
            builder: (context, state) => const FeedingPage(),
          ),
          GoRoute(
            path: '/services/medical_records',
            builder: (context, state) => const MedicalRecordsPage(),
          ),
          GoRoute(
            path: '/services/lost_pet',
            builder: (context, state) => const LostPetPage(),
          ),
          GoRoute(
            path: '/services/insurance',
            builder: (context, state) => const ExpensesPage(),
          ),
          GoRoute(
            path: '/services/expenses',
            builder: (context, state) => const ExpensesPage(),
          ),
          GoRoute(
            path: '/family',
            builder: (context, state) => const FamilyPage(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: '/settings/profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/settings/security',
            builder: (context, state) => const SecurityPage(),
          ),
          GoRoute(
            path: '/settings/linked-accounts',
            builder: (context, state) => const LinkedAccountsPage(),
          ),
          GoRoute(
            path: '/settings/quiet-hours',
            builder: (context, state) => const QuietHoursPage(),
          ),
          GoRoute(
            path: '/settings/reminder-times',
            builder: (context, state) => const ReminderTimesPage(),
          ),
          GoRoute(
            path: '/settings/language',
            builder: (context, state) => const LanguagePage(),
          ),
          GoRoute(
            path: '/settings/units',
            builder: (context, state) => const UnitsPage(),
          ),
          GoRoute(
            path: '/settings/backup',
            builder: (context, state) => const BackupPage(),
          ),
          GoRoute(
            path: '/settings/dark-mode',
            builder: (context, state) => const DarkModePage(),
          ),
          GoRoute(
            path: '/settings/change-password',
            builder: (context, state) => const ChangePasswordPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
}