// ignore_for_file: type=lint
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pawpal/main.dart';
import 'package:pawpal/core/theme/app_theme.dart';
import 'package:pawpal/core/widgets/index.dart';
import 'package:pawpal/features/auth/domain/entities/user.dart';
import 'package:pawpal/features/auth/presentation/providers/auth_provider.dart';
import 'package:pawpal/features/pets/domain/entities/pet.dart';
import 'package:pawpal/features/onboarding/presentation/pages/onboarding_page.dart';

class FakeAuthNotifier extends AuthNotifier {
  @override
  Future<User?> build() async => null;
}

void main() {
  group('PawPal App Tests', () {
    testWidgets('App starts and shows onboarding', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authProvider.overrideWith(() => FakeAuthNotifier()),
          ],
          child: const PawPalApp(),
        ),
      );
      await tester.pumpAndSettle();

      // Should show onboarding page
      expect(find.text('PawPal'), findsWidgets);
      expect(
        find.byWidgetPredicate(
          (widget) => widget is RichText && widget.text.toPlainText().contains('Care For All Your'),
        ),
        findsOneWidget,
      );
      expect(find.text('Get Started'), findsOneWidget);
    });

    testWidgets('Onboarding page has correct UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const OnboardingPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check logo
      expect(find.text('PawPal'), findsWidgets);

      // Check headline
      expect(
        find.byWidgetPredicate(
          (widget) => widget is RichText && widget.text.toPlainText().contains('Care For All Your'),
        ),
        findsOneWidget,
      );

      // Check subtext
      expect(find.textContaining('Track health, manage daily tasks'), findsOneWidget);

      // Check CTA button
      expect(find.text('Get Started'), findsOneWidget);
      expect(find.byType(PawlyButton), findsOneWidget);
    });
  });

  group('Theme Tests', () {
    test('Light theme has correct colors', () {
      final theme = AppTheme.lightTheme;
      final colors = theme.extension<PawPalColors>()!;

      expect(colors.background, equals(const Color(0xFFFFF6EE)));
      expect(colors.primary, equals(const Color(0xFF6B0F0A)));
      expect(colors.accent, equals(const Color(0xFFE8812B)));
      expect(colors.success, equals(const Color(0xFF56BF94)));
    });

    test('Dark theme has correct colors', () {
      final theme = AppTheme.darkTheme;
      final colors = theme.extension<PawPalColors>()!;

      expect(colors.background, equals(const Color(0xFF1E1412)));
      expect(colors.primary, equals(const Color(0xFF8A1F18)));
      expect(colors.accent, equals(const Color(0xFFE8812B)));
    });
  });

  group('Widget Tests', () {
    testWidgets('PawlyButton renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: PawlyButton(
                label: 'Test Button',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
    });

    testWidgets('PawlyPetAvatar renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: PawlyPetAvatar(
                name: 'Bella',
                size: 78,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(PawlyPetAvatar), findsOneWidget);
    });

    testWidgets('PawlyTaskCard renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: PawlyTaskCard(
                petName: 'Bella',
                title: 'Feeding',
                subtitle: 'Morning meal',
                time: '08:00 AM',
                index: 0,
                total: 1,
                onComplete: () {},
                onSnooze: () {},
                onSkip: () {},
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Bella – Feeding'), findsOneWidget);
      expect(find.text('Morning meal'), findsOneWidget);
      expect(find.text('08:00 AM'), findsOneWidget);
      expect(find.text('Complete'), findsOneWidget);
    });

    testWidgets('PawlyStatTile renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: Row(
                children: [
                  PawlyStatTile(icon: Icons.male, label: 'Sex', value: 'Male'),
                  SizedBox(width: 12),
                  PawlyStatTile(icon: Icons.cake, label: 'Age', value: '10 months'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sex'), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);
      expect(find.text('Age'), findsOneWidget);
      expect(find.text('10 months'), findsOneWidget);
    });
  });

  group('Pet Entity Tests', () {
    test('Pet entity calculates age correctly', () {
      final pet = Pet(
        id: 1,
        userId: 1,
        name: 'Bella',
        species: 'dog',
        breed: 'Golden Retriever',
        sex: 'female',
        birthDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
        weight: 12.8,
        weightUnit: 'kg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(pet.ageInMonths, greaterThan(30));
      expect(pet.formattedAge, contains('year'));
      expect(pet.formattedWeight, equals('12.8 kg'));
      expect(pet.speciesDisplayName, equals('Dog'));
    });

    test('Pet entity handles missing birth date', () {
      final pet = Pet(
        id: 1,
        userId: 1,
        name: 'Max',
        species: 'cat',
        approximateAge: '2 years',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(pet.formattedAge, equals('2 years'));
    });
  });
}
