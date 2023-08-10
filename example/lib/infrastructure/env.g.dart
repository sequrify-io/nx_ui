// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeyapiUrl = [];
  static const List<int> _envieddataapiUrl = [];
  static final apiUrl = String.fromCharCodes(
    List.generate(_envieddataapiUrl.length, (i) => i, growable: false)
        .map((i) => _envieddataapiUrl[i] ^ _enviedkeyapiUrl[i])
        .toList(growable: false),
  );
}
