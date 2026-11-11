// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDashboardDataUseCaseHash() =>
    r'683b3149fdf6d16610abfafccda435963b5b60df';

/// See also [getDashboardDataUseCase].
@ProviderFor(getDashboardDataUseCase)
final getDashboardDataUseCaseProvider =
    AutoDisposeProvider<GetDashboardDataUseCase>.internal(
  getDashboardDataUseCase,
  name: r'getDashboardDataUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDashboardDataUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDashboardDataUseCaseRef
    = AutoDisposeProviderRef<GetDashboardDataUseCase>;
String _$dashboardDataHash() => r'f59f080bbf5a0cd415a2277bfff20dafd8f2457c';

/// See also [DashboardData].
@ProviderFor(DashboardData)
final dashboardDataProvider = AutoDisposeAsyncNotifierProvider<DashboardData,
    DashboardDataEntity>.internal(
  DashboardData.new,
  name: r'dashboardDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DashboardData = AutoDisposeAsyncNotifier<DashboardDataEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
