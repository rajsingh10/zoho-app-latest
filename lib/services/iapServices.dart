import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

class IAPService {
  static final IAPService _instance = IAPService._internal();

  factory IAPService() => _instance;

  IAPService._internal();

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  // Callback functions
  Function(PurchaseDetails)? _successCallback;
  Function(String)? _errorCallback;

  List<ProductDetails> _products = [];

  List<ProductDetails> get products => _products;

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Listen to purchase updates
      _subscription = _inAppPurchase.purchaseStream.listen(
        _onPurchaseUpdate,
        onDone: () {
          _subscription.cancel();
        },
        onError: (error) {
          print('Purchase stream error: $error');
          if (_errorCallback != null) {
            _errorCallback!('Purchase stream error: $error');
          }
        },
      );

      // Initialize the plugin
      final bool available = await _inAppPurchase.isAvailable();
      if (!available) {
        print('In-App Purchases not available on this device');
        _isInitialized = true; // Mark as initialized but without IAP
        return;
      }

      _isInitialized = true;
      print('IAP Service initialized successfully');
    } catch (e) {
      print('IAP initialization error: $e');
      _isInitialized = true; // Mark as initialized but without IAP
    }
  }

  Future<void> loadProducts(List<String> productIds) async {
    if (productIds.isEmpty || !_isInitialized) {
      print('No product IDs provided or IAP not initialized');
      return;
    }

    try {
      final ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails(productIds.toSet());

      if (response.notFoundIDs.isNotEmpty) {
        print('Product IDs not found: ${response.notFoundIDs}');
      }

      if (response.error != null) {
        print('Error loading products: ${response.error}');
        return;
      }

      _products = response.productDetails;
      print('Loaded ${_products.length} IAP products');
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  Future<void> purchaseProduct(
    ProductDetails product, {
    required Function(PurchaseDetails) onSuccess,
    required Function(String) onError,
  }) async {
    if (!_isInitialized) {
      onError('IAP service not available');
      return;
    }

    // Set up callbacks FIRST before any async operations
    _successCallback = onSuccess;
    _errorCallback = onError;

    try {
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);

      // Start the purchase flow
      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);

      print('IAP purchase started for: ${product.id}');
    } catch (e) {
      // Clear callbacks on error
      _clearCallbacks();
      onError('Failed to start purchase: $e');
    }
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      _handlePurchase(purchaseDetails);
    }
  }

  void _handlePurchase(PurchaseDetails purchaseDetails) {
    print(
        'Purchase status: ${purchaseDetails.status} for product: ${purchaseDetails.productID}');

    switch (purchaseDetails.status) {
      case PurchaseStatus.pending:
        print('Purchase pending for: ${purchaseDetails.productID}');
        break;

      case PurchaseStatus.purchased:
        print('Purchase successful for: ${purchaseDetails.productID}');
        _verifyAndCompletePurchase(purchaseDetails);
        break;

      case PurchaseStatus.error:
        print('Purchase error: ${purchaseDetails.error}');
        if (_errorCallback != null) {
          _errorCallback!(
              'Purchase failed: ${purchaseDetails.error?.message ?? "Unknown error"}');
        }
        _clearCallbacks();
        break;

      case PurchaseStatus.canceled:
        print('Purchase canceled for: ${purchaseDetails.productID}');
        if (_errorCallback != null) {
          _errorCallback!('Purchase was canceled');
        }
        _clearCallbacks();
        break;

      case PurchaseStatus.restored:
        print('Purchase restored for: ${purchaseDetails.productID}');
        // Handle restored purchases if needed
        break;
    }
  }

  Future<void> _verifyAndCompletePurchase(
      PurchaseDetails purchaseDetails) async {
    try {
      print('Completing purchase: ${purchaseDetails.productID}');

      // Complete the purchase first
      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }

      // Call success callback
      if (_successCallback != null) {
        _successCallback!(purchaseDetails);
      } else {
        print('No success callback set for purchase');
      }

      _clearCallbacks();
    } catch (e) {
      print('Error completing purchase: $e');
      if (_errorCallback != null) {
        _errorCallback!('Purchase completion failed: $e');
      }
      _clearCallbacks();
    }
  }

  // Method to restore purchases (optional but recommended)
  Future<void> restorePurchases() async {
    try {
      await _inAppPurchase.restorePurchases();
    } catch (e) {
      print('Error restoring purchases: $e');
      rethrow;
    }
  }

  // Get product by ID
  ProductDetails? getProductById(String productId) {
    try {
      return _products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return null;
    }
  }

  // Check if a product is available
  bool isProductAvailable(String productId) {
    return getProductById(productId) != null;
  }

  // Clear callbacks to prevent memory leaks
  void _clearCallbacks() {
    _successCallback = null;
    _errorCallback = null;
  }

  void dispose() {
    _clearCallbacks();
    _subscription.cancel();
    _isInitialized = false;
    print('IAPService disposed');
  }
}
