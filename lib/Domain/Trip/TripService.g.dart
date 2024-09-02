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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
