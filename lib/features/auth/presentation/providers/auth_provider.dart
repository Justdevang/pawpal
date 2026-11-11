// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/errors/app_exceptions.dart';
import '../../domain/entities/user.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  User? _currentUser;

  @override
  Future<User?> build() async {
    if (_currentUser != null) return _currentUser;
    // Check for existing session
    try {
      final fbUser = fb_auth.FirebaseAuth.instance.currentUser;
      if (fbUser != null) {
        _currentUser = User(
          id: fbUser.uid,
          email: fbUser.email ?? '',
          displayName: fbUser.displayName,
          photoUrl: fbUser.photoURL,
          isGuest: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        return _currentUser;
      }
    } catch (_) {}
    return null;
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AsyncLoading();
    try {
      final credential = await fb_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final fbUser = credential.user!;
      state = AsyncData(User(
        id: fbUser.uid,
        email: fbUser.email ?? '',
        displayName: fbUser.displayName,
        photoUrl: fbUser.photoURL,
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    } on fb_auth.FirebaseAuthException catch (e) {
      state = AsyncData(null);
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    }
  }

  Future<void> registerWithEmail(String name, String email, String password) async {
    state = const AsyncLoading();
    try {
      final credential = await fb_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      final fbUser = credential.user!;
      state = AsyncData(User(
        id: fbUser.uid,
        email: fbUser.email ?? '',
        displayName: fbUser.displayName,
        photoUrl: fbUser.photoURL,
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    } on fb_auth.FirebaseAuthException catch (e) {
      state = AsyncData(null);
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    try {
      final googleUser = await GoogleSignIn(scopes: ['email', 'profile']).signIn();
      if (googleUser == null) {
        state = const AsyncData(null);
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = fb_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final userCredential = await fb_auth.FirebaseAuth.instance.signInWithCredential(credential);
      final fbUser = userCredential.user!;
      state = AsyncData(User(
        id: fbUser.uid,
        email: fbUser.email ?? '',
        displayName: fbUser.displayName,
        photoUrl: fbUser.photoURL,
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    } catch (e) {
      state = AsyncData(null);
      throw AuthException('Google sign in failed: $e');
    }
  }

  Future<void> signInWithApple() async {
    state = const AsyncLoading();
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
      );
      final oauthCredential = fb_auth.OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      final userCredential = await fb_auth.FirebaseAuth.instance.signInWithCredential(oauthCredential);
      final fbUser = userCredential.user!;

      // Update display name if provided by Apple
      if (credential.givenName != null || credential.familyName != null) {
        final name = '${credential.givenName ?? ''} ${credential.familyName ?? ''}'.trim();
        if (name.isNotEmpty) {
          await fbUser.updateDisplayName(name);
        }
      }

      state = AsyncData(User(
        id: fbUser.uid,
        email: fbUser.email ?? '',
        displayName: fbUser.displayName,
        photoUrl: fbUser.photoURL,
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    } catch (e) {
      state = AsyncData(null);
      throw AuthException('Apple sign in failed: $e');
    }
  }

  Future<void> signInAsGuest() async {
    // Pure local guest mode - immediately sets guest user session
    final guest = User(
      id: '0',
      email: 'guest@pawpal.local',
      displayName: 'Guest User',
      isGuest: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _currentUser = guest;
    state = AsyncData(guest);
  }

  Future<void> linkGuestAccount(String email, String password) async {
    state = const AsyncLoading();
    try {
      final currentUser = fb_auth.FirebaseAuth.instance.currentUser;
      if (currentUser == null || !currentUser.isAnonymous) {
        throw AuthException('No guest account to link');
      }

      final credential = fb_auth.EmailAuthProvider.credential(email: email, password: password);
      await currentUser.linkWithCredential(credential);
      await currentUser.updateDisplayName('Linked User');

      state = AsyncData(User(
        id: currentUser.uid,
        email: email,
        displayName: 'Linked User',
        photoUrl: currentUser.photoURL,
        isGuest: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    } on fb_auth.FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code), code: e.code);
    }
  }

  Future<void> signOut() async {
    _currentUser = null;
    try {
      await fb_auth.FirebaseAuth.instance.signOut();
    } catch (_) {}
    state = const AsyncData(null);
  }

  Future<void> deleteAccount() async {
    _currentUser = null;
    try {
      await fb_auth.FirebaseAuth.instance.currentUser?.delete();
    } catch (_) {}
    state = const AsyncData(null);
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      default:
        return 'Authentication failed. Please try again';
    }
  }
}

@riverpod
Stream<fb_auth.User?> authStateChanges(Ref ref) {
  try {
    return fb_auth.FirebaseAuth.instance.authStateChanges();
  } catch (_) {
    return const Stream.empty();
  }
}

/// Provider alias for authNotifierProvider
final authProvider = authNotifierProvider;

