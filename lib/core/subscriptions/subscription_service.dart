// ignore_for_file: type=lint
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_service.g.dart';

/// Subscription tier definitions
enum SubscriptionTier {
  free,
  premiumMonthly,
  premiumYearly,
  premiumLifetime,
}

/// Subscription product IDs for stores
class SubscriptionProducts {
  static const String premiumMonthly = 'pawpal_premium_monthly';
  static const String premiumYearly = 'pawpal_premium_yearly';
  static const String premiumLifetime = 'pawpal_premium_lifetime';

  static const List<String> allProducts = [
    premiumMonthly,
    premiumYearly,
    premiumLifetime,
  ];
}

/// Subscription status
enum SubscriptionStatus {
  active,
  expired,
  cancelled,
  pending,
  gracePeriod,
  billingIssue,
}

/// Subscription info
class SubscriptionInfo {
  final SubscriptionTier tier;
  final SubscriptionStatus status;
  final String? productId;
  final DateTime? expirationDate;
  final DateTime? purchaseDate;
  final bool isAutoRenewing;
  final String? originalTransactionId;
  final String? verificationData;

  const SubscriptionInfo({
    required this.tier,
    required this.status,
    this.productId,
    this.expirationDate,
    this.purchaseDate,
    this.isAutoRenewing = true,
    this.originalTransactionId,
    this.verificationData,
  });

  bool get isActive => status == SubscriptionStatus.active;
  bool get isPremium => tier != SubscriptionTier.free;
  bool get isInGracePeriod => status == SubscriptionStatus.gracePeriod;
  bool get hasBillingIssue => status == SubscriptionStatus.billingIssue;

  int get daysUntilExpiration {
    if (expirationDate == null) return -1;
    return expirationDate!.difference(DateTime.now()).inDays;
  }

  SubscriptionInfo copyWith({
    SubscriptionTier? tier,
    SubscriptionStatus? status,
    String? productId,
    DateTime? expirationDate,
    DateTime? purchaseDate,
    bool? isAutoRenewing,
    String? originalTransactionId,
    String? verificationData,
  }) {
    return SubscriptionInfo(
      tier: tier ?? this.tier,
      status: status ?? this.status,
      productId: productId ?? this.productId,
      expirationDate: expirationDate ?? this.expirationDate,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      isAutoRenewing: isAutoRenewing ?? this.isAutoRenewing,
      originalTransactionId: originalTransactionId ?? this.originalTransactionId,
      verificationData: verificationData ?? this.verificationData,
    );
  }
}

/// Abstract purchase service interface
abstract class PurchaseService {
  Future<void> initialize();
  Future<List<ProductInfo>> getProducts(List<String> productIds);
  Future<PurchaseResult> purchaseProduct(String productId);
  Future<PurchaseResult> restorePurchases();
  Future<SubscriptionInfo> getCurrentSubscription();
  Stream<SubscriptionInfo> watchSubscription();
  Future<bool> isPremium();
  Future<void> logout();
}

/// Product information
class ProductInfo {
  final String id;
  final String title;
  final String description;
  final String price;
  final String currencyCode;
  final String currencySymbol;
  final SubscriptionTier tier;
  final String? introductoryPrice;
  final int? introductoryPeriodDays;

  const ProductInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currencyCode,
    required this.currencySymbol,
    required this.tier,
    this.introductoryPrice,
    this.introductoryPeriodDays,
  });
}

/// Purchase result
class PurchaseResult {
  final bool success;
  final String? productId;
  final SubscriptionInfo? subscriptionInfo;
  final String? errorMessage;
  final PurchaseError? error;

  const PurchaseResult({
    required this.success,
    this.productId,
    this.subscriptionInfo,
    this.errorMessage,
    this.error,
  });

  /// Create a successful purchase result
  factory PurchaseResult.success(SubscriptionInfo info) {
    return PurchaseResult(
      success: true,
      productId: info.productId,
      subscriptionInfo: info,
    );
  }

  /// Create a failed purchase result
  factory PurchaseResult.failure(PurchaseError error, String message) {
    return PurchaseResult(
      success: false,
      error: error,
      errorMessage: message,
    );
  }
}

enum PurchaseError {
  userCancelled,
  paymentFailed,
  networkError,
  productNotFound,
  alreadyOwned,
  verificationFailed,
  storeError,
  unknown,
}

/// Mock purchase service for testing
class MockPurchaseService implements PurchaseService {
  SubscriptionInfo? _currentSubscription;
  final StreamController<SubscriptionInfo> _subscriptionController = StreamController.broadcast();

  @override
  Future<void> initialize() async {
    // Simulate free tier
    _currentSubscription = const SubscriptionInfo(
      tier: SubscriptionTier.free,
      status: SubscriptionStatus.active,
    );
  }

  @override
  Future<List<ProductInfo>> getProducts(List<String> productIds) async {
    return productIds.map((id) {
      final tier = _getTierFromProductId(id);
      return ProductInfo(
        id: id,
        title: _getTitleForTier(tier),
        description: _getDescriptionForTier(tier),
        price: _getPriceForTier(tier),
        currencyCode: 'USD',
        currencySymbol: '\$',
        tier: tier,
      );
    }).toList();
  }

  @override
  Future<PurchaseResult> purchaseProduct(String productId) async {
    // Simulate purchase delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate success
    final tier = _getTierFromProductId(productId);
    final now = DateTime.now();
    final expiration = tier == SubscriptionTier.premiumYearly
        ? now.add(const Duration(days: 365))
        : tier == SubscriptionTier.premiumMonthly
            ? now.add(const Duration(days: 30))
            : null;

    final info = SubscriptionInfo(
      tier: tier,
      status: SubscriptionStatus.active,
      productId: productId,
      expirationDate: expiration,
      purchaseDate: now,
      isAutoRenewing: tier != SubscriptionTier.premiumLifetime,
      originalTransactionId: 'mock_txn_${DateTime.now().millisecondsSinceEpoch}',
    );

    _currentSubscription = info;
    _subscriptionController.add(info);

    return PurchaseResult.success(info);
  }

  @override
  Future<PurchaseResult> restorePurchases() async {
    // Simulate restore
    await Future.delayed(const Duration(seconds: 1));
    return PurchaseResult.success(_currentSubscription ?? const SubscriptionInfo(
      tier: SubscriptionTier.free,
      status: SubscriptionStatus.active,
    ));
  }

  @override
  Future<SubscriptionInfo> getCurrentSubscription() async {
    return _currentSubscription ?? const SubscriptionInfo(
      tier: SubscriptionTier.free,
      status: SubscriptionStatus.active,
    );
  }

  @override
  Stream<SubscriptionInfo> watchSubscription() {
    return _subscriptionController.stream;
  }

  @override
  Future<bool> isPremium() async {
    final sub = await getCurrentSubscription();
    return sub.isPremium;
  }

  @override
  Future<void> logout() async {
    _currentSubscription = const SubscriptionInfo(
      tier: SubscriptionTier.free,
      status: SubscriptionStatus.active,
    );
    _subscriptionController.add(_currentSubscription!);
  }

  SubscriptionTier _getTierFromProductId(String productId) {
    if (productId.contains('lifetime')) return SubscriptionTier.premiumLifetime;
    if (productId.contains('yearly')) return SubscriptionTier.premiumYearly;
    if (productId.contains('monthly')) return SubscriptionTier.premiumMonthly;
    return SubscriptionTier.free;
  }

  String _getTitleForTier(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.premiumMonthly:
        return 'Premium Monthly';
      case SubscriptionTier.premiumYearly:
        return 'Premium Yearly (Save 30%)';
      case SubscriptionTier.premiumLifetime:
        return 'Premium Lifetime';
      default:
        return 'Free';
    }
  }

  String _getDescriptionForTier(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.premiumMonthly:
        return 'Unlimited pets, family sharing, PDF export, all services';
      case SubscriptionTier.premiumYearly:
        return 'Unlimited pets, family sharing, PDF export, all services - billed yearly';
      case SubscriptionTier.premiumLifetime:
        return 'Unlimited pets, family sharing, PDF export, all services - one-time payment';
      default:
        return 'Up to 2 pets, basic reminders';
    }
  }

  String _getPriceForTier(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.premiumMonthly:
        return '4.99';
      case SubscriptionTier.premiumYearly:
        return '39.99';
      case SubscriptionTier.premiumLifetime:
        return '99.99';
      default:
        return '0.00';
    }
  }
}

/// Riverpod provider for PurchaseService
final purchaseServiceProvider = Provider<PurchaseService>((ref) {
  // In production, use real implementation (in_app_purchase or purchases_flutter)
  return MockPurchaseService();
});

/// Provider for current subscription
final subscriptionProvider = StreamProvider<SubscriptionInfo>((ref) {
  final service = ref.watch(purchaseServiceProvider);
  return service.watchSubscription();
});

/// Provider for current subscription info
final currentSubscriptionProvider = FutureProvider<SubscriptionInfo>((ref) {
  final service = ref.watch(purchaseServiceProvider);
  return service.getCurrentSubscription();
});

/// Provider for premium status
final isPremiumProvider = FutureProvider<bool>((ref) {
  final service = ref.watch(purchaseServiceProvider);
  return service.isPremium();
});

@riverpod
class PaywallStateNotifier extends _$PaywallStateNotifier {
  @override
  PaywallState build() {
    return PaywallState.initial();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true);
    try {
      final products = await ref.read(purchaseServiceProvider).getProducts(SubscriptionProducts.allProducts);
      state = state.copyWith(
        products: products,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> purchase(String productId) async {
    state = state.copyWith(isPurchasing: true, error: null);
    try {
      final result = await ref.read(purchaseServiceProvider).purchaseProduct(productId);
      if (result.success) {
        state = state.copyWith(isPurchasing: false, isPremium: true);
      } else {
        state = state.copyWith(
          isPurchasing: false,
          error: result.errorMessage ?? 'Purchase failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isPurchasing: false,
        error: e.toString(),
      );
    }
  }

  Future<void> restorePurchases() async {
    state = state.copyWith(isRestoring: true, error: null);
    try {
      final result = await ref.read(purchaseServiceProvider).restorePurchases();
      if (result.success) {
        state = state.copyWith(isRestoring: false, isPremium: true);
      } else {
        state = state.copyWith(
          isRestoring: false,
          error: result.errorMessage ?? 'Restore failed',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isRestoring: false,
        error: e.toString(),
      );
    }
  }

  void dismissError() {
    state = state.copyWith(error: null);
  }
}

class PaywallState {
  final bool isLoading;
  final bool isPurchasing;
  final bool isRestoring;
  final bool isPremium;
  final String? error;
  final List<ProductInfo> products;

  const PaywallState({
    this.isLoading = false,
    this.isPurchasing = false,
    this.isRestoring = false,
    this.isPremium = false,
    this.error,
    this.products = const [],
  });

  factory PaywallState.initial() => const PaywallState();

  PaywallState copyWith({
    bool? isLoading,
    bool? isPurchasing,
    bool? isRestoring,
    bool? isPremium,
    String? error,
    List<ProductInfo>? products,
  }) {
    return PaywallState(
      isLoading: isLoading ?? this.isLoading,
      isPurchasing: isPurchasing ?? this.isPurchasing,
      isRestoring: isRestoring ?? this.isRestoring,
      isPremium: isPremium ?? this.isPremium,
      error: error ?? this.error,
      products: products ?? this.products,
    );
  }
}

