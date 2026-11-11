// ignore_for_file: type=lint

/// Custom exception classes for the app
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException(this.message, {this.code, this.originalError});

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

class NetworkException extends AppException {
  const NetworkException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class AuthException extends AppException {
  const AuthException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class ValidationException extends AppException {
  final Map<String, String> fieldErrors;

  const ValidationException(String message, {this.fieldErrors = const {}, String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class DatabaseException extends AppException {
  const DatabaseException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class PermissionException extends AppException {
  const PermissionException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class NotFoundException extends AppException {
  const NotFoundException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

class SyncException extends AppException {
  const SyncException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// Result type for operations that can fail
sealed class Result<T> {
  const Result();

  T? get data => switch (this) {
        Success(data: final d) => d,
        _ => null,
      };

  AppException? get error => switch (this) {
        Failure(error: final e) => e,
        _ => null,
      };

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final AppException error;
  const Failure(this.error);
}

/// Extension for easier Result handling
extension ResultX<T> on Result<T> {
  R fold<R>(R Function(T data) onSuccess, R Function(AppException error) onFailure) {
    return switch (this) {
      Success(data: final d) => onSuccess(d),
      Failure(error: final e) => onFailure(e),
    };
  }

  Future<R> foldAsync<R>(Future<R> Function(T data) onSuccess, Future<R> Function(AppException error) onFailure) async {
    return switch (this) {
      Success(data: final d) => await onSuccess(d),
      Failure(error: final e) => await onFailure(e),
    };
  }
}