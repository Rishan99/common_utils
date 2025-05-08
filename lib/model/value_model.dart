import 'dart:convert';

class ValueModel {
  final int id;
  final String name;
  final int? dependentId;
  ValueModel({
    required this.id,
    required this.name,
    this.dependentId,
  });

  ValueModel copyWith({
    int? id,
    String? name,
    int? dependentId,
  }) {
    return ValueModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dependentId: dependentId ?? this.dependentId,
    );
  }

  factory ValueModel.fromMap(Map<String, dynamic> map) {
    return ValueModel(
      id: (map['id'] ?? map['value'])?.toInt() ?? 0,
      name: map['name'] ?? map['label'] ?? '',
      dependentId: map['dependent_id'],
    );
  }

  factory ValueModel.fromJson(String source) => ValueModel.fromMap(json.decode(source));
}
