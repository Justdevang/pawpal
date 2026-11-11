// ignore_for_file: type=lint
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawpal/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End App Tests', () {
    testWidgets('App launches and shows onboarding', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Should show onboarding page
      expect(find.text('Pawly'), findsOneWidget);
      expect(find.text('Care For All Your'), findsOneWidget);
      expect(find.text('Pets In One Place'), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
    });

    testWidgets('Navigation to login page', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Tap Get Started button
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Should navigate to login page
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to continue'), findsOneWidget);
    });

    testWidgets('Navigation to register page', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Tap Sign Up link
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Should navigate to register page
      expect(find.text('Create Account'), findsOneWidget);
    });

    testWidgets('Guest mode flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Tap Continue as Guest
      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Should navigate to dashboard
      expect(find.text("Manage Your Pets'"), findsOneWidget);
      expect(find.text('Daily Care Easily'), findsOneWidget);
    });

    testWidgets('Add pet flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Tap Add New Pet
      await tester.tap(find.text('Add New Pet'));
      await tester.pumpAndSettle();

      // Fill pet form
      await tester.enterText(find.byType(TextFormField).first, 'Buddy');
      await tester.pumpAndSettle();

      // Select species
      await tester.tap(find.text('Species'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dog').last);
      await tester.pumpAndSettle();

      // Save
      await tester.tap(find.text('Add Pet'));
      await tester.pumpAndSettle();

      // Should show pet in list
      expect(find.text('Buddy'), findsOneWidget);
    });

    testWidgets('Add vaccination flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Navigate to vaccinations
      await tester.tap(find.text('Vaccinations'));
      await tester.pumpAndSettle();

      // Add vaccination
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Select vaccine
      await tester.tap(find.text('Vaccine'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Rabies').first);
      await tester.pumpAndSettle();

      // Save
      await tester.tap(find.text('Save Vaccination'));
      await tester.pumpAndSettle();

      // Should show vaccination
      expect(find.text('Rabies'), findsOneWidget);
    });

    testWidgets('Add medication flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Navigate to medications
      await tester.tap(find.text('Medications'));
      await tester.pumpAndSettle();

      // Add medication
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Fill form
      await tester.enterText(find.byType(TextFormField).first, 'Heartgard');
      await tester.pumpAndSettle();

      // Save
      await tester.tap(find.text('Save Medication'));
      await tester.pumpAndSettle();

      // Should show medication
      expect(find.text('Heartgard'), findsOneWidget);
    });

    testWidgets('Settings navigation', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Open settings
      await tester.tap(find.byIcon(Icons.menu).first);
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('Dark mode toggle in settings', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue as Guest'));
      await tester.pumpAndSettle();

      // Open settings
      await tester.tap(find.byIcon(Icons.menu).first);
      await tester.pumpAndSettle();

      // Find dark mode toggle
      final darkModeToggle = find.byType(Switch).first;
      expect(darkModeToggle, findsOneWidget);

      // Toggle it
      await tester.tap(darkModeToggle);
      await tester.pumpAndSettle();
    });
  });
}
