# PawPal 🐾

A production-grade cross-platform pet care app for Android and iOS, built with Flutter.

## Features (MVP)

- **Pet Profiles** - Manage multiple pets with photos, health info, and microchip details
- **Vaccination Tracker** - Preloaded vaccine schedules per species, auto-calculated due dates, PDF export
- **Medicine Reminders** - Flexible scheduling, dose logging, snooze/skip actions, refill alerts
- **Smart Notifications** - Local notifications with action buttons, works offline, survives reboot
- **Home Dashboard** - Today's tasks, overdue items, health summaries
- **Family Sharing** - Invite co-managers for shared pet care
- **Offline-First** - Drift/SQLite local database with background Firebase sync
- **Accessibility** - Dynamic text, screen readers, contrast AA, RTL-ready

## Tech Stack

- **Framework**: Flutter 3.24+, Dart 3.5+, Null-safe
- **State Management**: Riverpod 2.6+
- **Navigation**: go_router 14+
- **Local DB**: Drift (SQLite) 2.22+
- **Backend**: Firebase (Auth, Firestore, Storage, Messaging, Crashlytics, Analytics)
- **Notifications**: flutter_local_notifications + timezone + android_alarm_manager_plus
- **Architecture**: Feature-first Clean Architecture (Presentation / Domain / Data)
- **Testing**: Unit, Widget, Integration tests
- **CI/CD**: GitHub Actions

## Project Structure

```
lib/
├── core/                    # Shared core functionality
│   ├── config/             # App configuration
│   ├── database/           # Drift database, tables, DAOs
│   ├── di/                 # Dependency injection (Riverpod providers)
│   ├── errors/             # Custom exceptions, Result type
│   ├── extensions/         # Dart extensions
│   ├── notifications/      # Notification service
│   ├── routing/            # go_router configuration
│   ├── theme/              # Theme, colors, typography
│   ├── utils/              # Constants, helpers
│   └── widgets/            # Reusable UI components
├── features/               # Feature modules (clean architecture)
│   ├── auth/               # Authentication
│   ├── onboarding/         # Onboarding flow
│   ├── pets/               # Pet profiles
│   ├── vaccinations/       # Vaccination tracker
│   ├── medications/        # Medicine reminders
│   ├── reminders/          # Reminder engine
│   ├── dashboard/          # Home dashboard
│   ├── settings/           # Settings
│   ├── family/             # Family sharing
│   └── services/           # Extensible services registry
└── shared/                 # Shared models, widgets, constants
```

## Getting Started

### Prerequisites

- Flutter SDK 3.24+
- Dart SDK 3.5+
- Android Studio / Xcode
- Firebase project

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd PAWPAL
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code:
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Configure Firebase:
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`
   - Copy `.env.example` to `.env` and fill in your values

5. Run the app:
```bash
# Development
flutter run --flavor dev

# Production
flutter run --flavor prod
```

### Code Generation

Run after model changes:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Flavors

- **dev**: Development build with debug features
- **prod**: Production build with optimizations

```bash
# Android
flutter build apk --flavor dev
flutter build appbundle --flavor prod

# iOS
flutter build ios --flavor dev
flutter build ios --flavor prod
```

## Testing

```bash
# Unit & Widget tests
flutter test

# Integration tests
flutter test integration_test/
```

## Architecture Decisions

### Clean Architecture Layers

Each feature follows:
```
features/<feature>/
├── data/
│   ├── datasources/      # Local (Drift) & Remote (Firestore) implementations
│   ├── models/           # DTOs with serialization
│   └── repositories/     # Repository implementations
├── domain/
│   ├── entities/         # Pure Dart business objects
│   ├── repositories/     # Repository interfaces
│   └── usecases/         # Business logic
└── presentation/
    ├── pages/            # Screens
    ├── widgets/          # Feature-specific widgets
    └── providers/        # Riverpod providers
```

### Reminder Engine

Generic `Reminder` model powers all notification types:
- Type: vaccination, medication, appointment, weight, custom
- Schedule rule: cron expression or ISO8601 interval
- Payload: JSON for type-specific data
- Escalation: re-notify if no action
- Family notification: optional notify shared members

### Services Registry

Plugin-style architecture for extensibility:
- Each service implements `ServiceInterface`
- Register in `ServiceConfig` table
- Add new service: create folder + register in one place

## Contributing

1. Follow the existing code style (enforced by `flutter analyze`)
2. Write tests for new features
3. Update documentation as needed
4. Create feature branches from `develop`
5. Submit PRs to `develop`

## License

MIT License - see LICENSE file for details.