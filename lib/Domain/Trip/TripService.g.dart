// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripsHash() => r'8b21ac85b279dd3114bbde32ae72656b71d5ead8';

/// See also [trips].
@ProviderFor(trips)
final tripsProvider = AutoDisposeFutureProvider<DriverResponseModel>.internal(
  trips,
  name: r'tripsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tripsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TripsRef = AutoDisposeFutureProviderRef<DriverResponseModel>;
String _$tripDataHash() => r'770a451fbfb02629062c177bca28d408cce61782';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [tripData].
@ProviderFor(tripData)
const tripDataProvider = TripDataFamily();

/// See also [tripData].
class TripDataFamily extends Family<AsyncValue<BiltyResponseData>> {
  /// See also [tripData].
  const TripDataFamily();

  /// See also [tripData].
  TripDataProvider call({
    required String? tripRequestid,
  }) {
    return TripDataProvider(
      tripRequestid: tripRequestid,
    );
  }

  @override
  TripDataProvider getProviderOverride(
    covariant TripDataProvider provider,
  ) {
    return call(
      tripRequestid: provider.tripRequestid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripDataProvider';
}

/// See also [tripData].
class TripDataProvider extends AutoDisposeFutureProvider<BiltyResponseData> {
  /// See also [tripData].
  TripDataProvider({
    required String? tripRequestid,
  }) : this._internal(
          (ref) => tripData(
            ref as TripDataRef,
            tripRequestid: tripRequestid,
          ),
          from: tripDataProvider,
          name: r'tripDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripDataHash,
          dependencies: TripDataFamily._dependencies,
          allTransitiveDependencies: TripDataFamily._allTransitiveDependencies,
          tripRequestid: tripRequestid,
        );

  TripDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripRequestid,
  }) : super.internal();

  final String? tripRequestid;

  @override
  Override overrideWith(
    FutureOr<BiltyResponseData> Function(TripDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripDataProvider._internal(
        (ref) => create(ref as TripDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripRequestid: tripRequestid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BiltyResponseData> createElement() {
    return _TripDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripDataProvider && other.tripRequestid == tripRequestid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripRequestid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TripDataRef on AutoDisposeFutureProviderRef<BiltyResponseData> {
  /// The parameter `tripRequestid` of this provider.
  String? get tripRequestid;
}

class _TripDataProviderElement
    extends AutoDisposeFutureProviderElement<BiltyResponseData>
    with TripDataRef {
  _TripDataProviderElement(super.provider);

  @override
  String? get tripRequestid => (origin as TripDataProvider).tripRequestid;
}

String _$endTripHash() => r'727924de373ccd1cf74ddabf8a4c0ddd294d9724';

/// See also [endTrip].
@ProviderFor(endTrip)
const endTripProvider = EndTripFamily();

/// See also [endTrip].
class EndTripFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [endTrip].
  const EndTripFamily();

  /// See also [endTrip].
  EndTripProvider call({
    String? tripRequestId,
    String? kantaWeight,
    String? bags,
    String? kantaImage,
    String? qualityImage,
  }) {
    return EndTripProvider(
      tripRequestId: tripRequestId,
      kantaWeight: kantaWeight,
      bags: bags,
      kantaImage: kantaImage,
      qualityImage: qualityImage,
    );
  }

  @override
  EndTripProvider getProviderOverride(
    covariant EndTripProvider provider,
  ) {
    return call(
      tripRequestId: provider.tripRequestId,
      kantaWeight: provider.kantaWeight,
      bags: provider.bags,
      kantaImage: provider.kantaImage,
      qualityImage: provider.qualityImage,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'endTripProvider';
}

/// See also [endTrip].
class EndTripProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [endTrip].
  EndTripProvider({
    String? tripRequestId,
    String? kantaWeight,
    String? bags,
    String? kantaImage,
    String? qualityImage,
  }) : this._internal(
          (ref) => endTrip(
            ref as EndTripRef,
            tripRequestId: tripRequestId,
            kantaWeight: kantaWeight,
            bags: bags,
            kantaImage: kantaImage,
            qualityImage: qualityImage,
          ),
          from: endTripProvider,
          name: r'endTripProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$endTripHash,
          dependencies: EndTripFamily._dependencies,
          allTransitiveDependencies: EndTripFamily._allTransitiveDependencies,
          tripRequestId: tripRequestId,
          kantaWeight: kantaWeight,
          bags: bags,
          kantaImage: kantaImage,
          qualityImage: qualityImage,
        );

  EndTripProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripRequestId,
    required this.kantaWeight,
    required this.bags,
    required this.kantaImage,
    required this.qualityImage,
  }) : super.internal();

  final String? tripRequestId;
  final String? kantaWeight;
  final String? bags;
  final String? kantaImage;
  final String? qualityImage;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(EndTripRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EndTripProvider._internal(
        (ref) => create(ref as EndTripRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripRequestId: tripRequestId,
        kantaWeight: kantaWeight,
        bags: bags,
        kantaImage: kantaImage,
        qualityImage: qualityImage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _EndTripProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EndTripProvider &&
        other.tripRequestId == tripRequestId &&
        other.kantaWeight == kantaWeight &&
        other.bags == bags &&
        other.kantaImage == kantaImage &&
        other.qualityImage == qualityImage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripRequestId.hashCode);
    hash = _SystemHash.combine(hash, kantaWeight.hashCode);
    hash = _SystemHash.combine(hash, bags.hashCode);
    hash = _SystemHash.combine(hash, kantaImage.hashCode);
    hash = _SystemHash.combine(hash, qualityImage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EndTripRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `tripRequestId` of this provider.
  String? get tripRequestId;

  /// The parameter `kantaWeight` of this provider.
  String? get kantaWeight;

  /// The parameter `bags` of this provider.
  String? get bags;

  /// The parameter `kantaImage` of this provider.
  String? get kantaImage;

  /// The parameter `qualityImage` of this provider.
  String? get qualityImage;
}

class _EndTripProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with EndTripRef {
  _EndTripProviderElement(super.provider);

  @override
  String? get tripRequestId => (origin as EndTripProvider).tripRequestId;
  @override
  String? get kantaWeight => (origin as EndTripProvider).kantaWeight;
  @override
  String? get bags => (origin as EndTripProvider).bags;
  @override
  String? get kantaImage => (origin as EndTripProvider).kantaImage;
  @override
  String? get qualityImage => (origin as EndTripProvider).qualityImage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
