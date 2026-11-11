// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// App localizations delegate
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('fr', 'FR'),
    Locale('de', 'DE'),
    Locale('ar', 'SA'),
    Locale('zh', 'CN'),
    Locale('ja', 'JP'),
    Locale('ko', 'KR'),
    Locale('pt', 'BR'),
    Locale('hi', 'IN'),
  ];

  // Common strings
  String get appName => 'PawPal';
  String get ok => _get('ok');
  String get cancel => _get('cancel');
  String get save => _get('save');
  String get delete => _get('delete');
  String get edit => _get('edit');
  String get add => _get('add');
  String get search => _get('search');
  String get settings => _get('settings');
  String get profile => _get('profile');
  String get pets => _get('pets');
  String get vaccinations => _get('vaccinations');
  String get medications => _get('medications');
  String get reminders => _get('reminders');
  String get dashboard => _get('dashboard');
  String get services => _get('services');
  String get family => _get('family');

  // Onboarding
  String get careForAllYourPets => _get('care_for_all_your_pets');
  String get petsInOnePlace => _get('pets_in_one_place');
  String get trackHealthManageTasks => _get('track_health_manage_tasks');
  String get getStarted => _get('get_started');

  // Auth
  String get welcomeBack => _get('welcome_back');
  String get signInToContinue => _get('sign_in_to_continue');
  String get email => _get('email');
  String get password => _get('password');
  String get forgotPassword => _get('forgot_password');
  String get signIn => _get('sign_in');
  String get createAccount => _get('create_account');
  String get fullName => _get('full_name');
  String get confirmPassword => _get('confirm_password');
  String get alreadyHaveAccount => _get('already_have_account');
  String get signUp => _get('sign_up');
  String get continueAsGuest => _get('continue_as_guest');
  String get tryAsGuest => _get('try_as_guest');
  String get exploreWithoutAccount => _get('explore_without_account');

  // Pets
  String get myPets => _get('my_pets');
  String get addPet => _get('add_pet');
  String get editPet => _get('edit_pet');
  String get petName => _get('pet_name');
  String get species => _get('species');
  String get breed => _get('breed');
  String get sex => _get('sex');
  String get birthDate => _get('birth_date');
  String get weight => _get('weight');
  String get microchip => _get('microchip');
  String get notes => _get('notes');
  String get male => _get('male');
  String get female => _get('female');
  String get unknown => _get('unknown');
  String get dog => _get('dog');
  String get cat => _get('cat');
  String get rabbit => _get('rabbit');
  String get hamster => _get('hamster');
  String get bird => _get('bird');
  String get other => _get('other');

  // Vaccinations
  String get vaccinationTracker => _get('vaccination_tracker');
  String get addVaccination => _get('add_vaccination');
  String get vaccineName => _get('vaccine_name');
  String get dateGiven => _get('date_given');
  String get nextDueDate => _get('next_due_date');
  String get vetClinic => _get('vet_clinic');
  String get batchNumber => _get('batch_number');
  String get certificate => _get('certificate');
  String get exportPDF => _get('export_pdf');
  String get overdue => _get('overdue');
  String get dueSoon => _get('due_soon');
  String get completed => _get('completed');

  // Medications
  String get medicationReminders => _get('medication_reminders');
  String get addMedication => _get('add_medication');
  String get medicationName => _get('medication_name');
  String get dosage => _get('dosage');
  String get form => _get('form');
  String get frequency => _get('frequency');
  String get startDate => _get('start_date');
  String get endDate => _get('end_date');
  String get withFood => _get('with_food');
  String get instructions => _get('instructions');
  String get remainingDoses => _get('remaining_doses');
  String get refillAlert => _get('refill_alert');
  String get refillNeeded => _get('refill_needed');
  String get logDose => _get('log_dose');
  String get snooze => _get('snooze');
  String get skip => _get('skip');
  String get taken => _get('taken');
  String get missed => _get('missed');
  String get adherenceStreak => _get('adherence_streak');

  // Reminders
  String get reminderEngine => _get('reminder_engine');
  String get upcoming => _get('upcoming');
  String get noReminders => _get('no_reminders');
  String get allCaughtUp => _get('all_caught_up');

  // Settings
  String get account => _get('account');
  String get security => _get('security');
  String get linkedAccounts => _get('linked_accounts');
  String get notifications => _get('notifications');
  String get pushNotifications => _get('push_notifications');
  String get quietHours => _get('quiet_hours');
  String get reminderTimes => _get('reminder_times');
  String get appearance => _get('appearance');
  String get darkMode => _get('dark_mode');
  String get language => _get('language');
  String get units => _get('units');
  String get metric => _get('metric');
  String get imperial => _get('imperial');
  String get dataPrivacy => _get('data_privacy');
  String get exportData => _get('export_data');
  String get backupSync => _get('backup_sync');
  String get deleteAccount => _get('delete_account');
  String get about => _get('about');
  String get version => _get('version');
  String get privacyPolicy => _get('privacy_policy');
  String get termsOfService => _get('terms_of_service');
  String get helpSupport => _get('help_support');
  String get rateApp => _get('rate_app');

  // Common actions
  String get confirm => _get('confirm');
  String get retry => _get('retry');
  String get loading => _get('loading');
  String get error => _get('error');
  String get success => _get('success');
  String get warning => _get('warning');
  String get info => _get('info');

  String _get(String key) {
    // In real implementation, this would look up from ARB files
    // For now, return English key as fallback
    return key.replaceAll('_', ' ').capitalize();
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
