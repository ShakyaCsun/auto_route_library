import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class Parameters {
  final Map<String, dynamic> _params;

  const Parameters(Map<String, dynamic>? params) : _params = params ?? const {};

  Map<String, dynamic> get rawMap => _params;

  @override
  String toString() {
    return _params.toString();
  }

  Parameters operator +(Parameters other) =>
      Parameters({..._params, ...other._params});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Parameters &&
          runtimeType == other.runtimeType &&
          const MapEquality(
            values: DeepCollectionEquality(),
          ).equals(_params, other._params);

  @override
  int get hashCode => _params.hashCode;

  bool get isNotEmpty => _params.isNotEmpty;
  bool get isEmpty => _params.isEmpty;

  dynamic get(String key, [dynamic defaultValue]) {
    return _params[key] ?? defaultValue;
  }

  String? optString(String key, [String? defaultValue]) =>
      _params[key] as String? ?? defaultValue;

  String getString(String key, [String? defaultValue]) {
    final String? val = _params[key] as String? ?? defaultValue;
    if (val == null) {
      throw FlutterError(
        'Failed to parse [String] $key value from ${_params[key]}',
      );
    }
    return val;
  }

  int? optInt(String key, [int? defaultValue]) {
    final param = _params[key];
    if (param == null) {
      return defaultValue;
    } else if (param is int) {
      return param;
    } else {
      return int.tryParse(param.toString()) ?? defaultValue;
    }
  }

  int getInt(String key, [int? defaultValue]) {
    final val = optInt(key, defaultValue);
    if (val == null) {
      throw FlutterError(
        'Failed to parse [int] $key value from ${_params[key]}',
      );
    }
    return val;
  }

  double? optDouble(String key, [double? defaultValue]) {
    final param = _params[key];
    if (param == null) {
      return defaultValue;
    } else if (param is double) {
      return param;
    } else {
      return double.tryParse(param.toString()) ?? defaultValue;
    }
  }

  double getDouble(String key, [double? defaultValue]) {
    final val = optDouble(key, defaultValue);
    if (val == null) {
      throw FlutterError(
        'Failed to parse [double] $key value from ${_params[key]}',
      );
    }
    return val;
  }

  num? optNum(String key, [num? defaultValue]) {
    final param = _params[key];
    if (param == null) {
      return defaultValue;
    } else if (param is num) {
      return param;
    } else {
      return double.tryParse(param.toString()) ?? defaultValue;
    }
  }

  num getNum(String key, [num? defaultValue]) {
    final val = optNum(key, defaultValue);
    if (val == null) {
      throw FlutterError(
        'Failed to parse [num] $key value from ${_params[key]}',
      );
    }
    return val;
  }

  bool? optBool(String key, [bool? defaultValue]) {
    switch (_params[key]?.toLowerCase()) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        return defaultValue;
    }
  }

  bool getBool(String key, [bool? defaultValue]) {
    final val = optBool(key, defaultValue);
    if (val == null) {
      throw FlutterError(
        'Failed to parse [bool] $key value from ${_params[key]}',
      );
    }
    return val;
  }
}
