import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barocode;
  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barocode,
  });

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barocode,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barocode: barocode ?? this.barocode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barocode': barocode,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barocode: map['barocode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barocode: $barocode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.barocode == barocode;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      barocode.hashCode;
  }
}
