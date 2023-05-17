import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receptionist.freezed.dart';
part 'receptionist.g.dart';

@freezed
class Receptionist with _$Receptionist {
  const factory Receptionist({
    required String name,
    required DateTime birthDate,
  }) = _Receptionist;

  factory Receptionist.fromJson(Map<String, Object?> json)
  => _$ReceptionistFromJson(json);
}