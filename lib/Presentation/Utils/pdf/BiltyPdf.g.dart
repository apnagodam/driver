// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BiltyPdf.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createBiltyPdfHash() => r'cdd956b2c4854dd346ddd33083e994218e8c149a';

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

/// See also [createBiltyPdf].
@ProviderFor(createBiltyPdf)
const createBiltyPdfProvider = CreateBiltyPdfFamily();

/// See also [createBiltyPdf].
class CreateBiltyPdfFamily extends Family<AsyncValue<File?>> {
  /// See also [createBiltyPdf].
  const CreateBiltyPdfFamily();

  /// See also [createBiltyPdf].
  CreateBiltyPdfProvider call({
    required BuildContext context,
  }) {
    return CreateBiltyPdfProvider(
      context: context,
    );
  }

  @override
  CreateBiltyPdfProvider getProviderOverride(
    covariant CreateBiltyPdfProvider provider,
  ) {
    return call(
      context: provider.context,
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
  String? get name => r'createBiltyPdfProvider';
}

/// See also [createBiltyPdf].
class CreateBiltyPdfProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [createBiltyPdf].
  CreateBiltyPdfProvider({
    required BuildContext context,
  }) : this._internal(
          (ref) => createBiltyPdf(
            ref as CreateBiltyPdfRef,
            context: context,
          ),
          from: createBiltyPdfProvider,
          name: r'createBiltyPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createBiltyPdfHash,
          dependencies: CreateBiltyPdfFamily._dependencies,
          allTransitiveDependencies:
              CreateBiltyPdfFamily._allTransitiveDependencies,
          context: context,
        );

  CreateBiltyPdfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<File?> Function(CreateBiltyPdfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateBiltyPdfProvider._internal(
        (ref) => create(ref as CreateBiltyPdfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _CreateBiltyPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateBiltyPdfProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateBiltyPdfRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _CreateBiltyPdfProviderElement
    extends AutoDisposeFutureProviderElement<File?> with CreateBiltyPdfRef {
  _CreateBiltyPdfProviderElement(super.provider);

  @override
  BuildContext get context => (origin as CreateBiltyPdfProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
