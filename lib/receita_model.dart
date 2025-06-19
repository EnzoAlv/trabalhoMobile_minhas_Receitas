import 'package:uuid/uuid.dart';

class Receita {
  final String id;
  final String nome;
  final String ingredientes;
  final String modoDePreparo;
  final String categoria;

  Receita({
    required this.id,
    required this.nome,
    required this.ingredientes,
    required this.modoDePreparo,
    required this.categoria,
  });

  Receita copyWith({
    String? id,
    String? nome,
    String? ingredientes,
    String? modoDePreparo,
    String? categoria,
  }) {
    return Receita(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      ingredientes: ingredientes ?? this.ingredientes,
      modoDePreparo: modoDePreparo ?? this.modoDePreparo,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'ingredientes': ingredientes,
      'modoDePreparo': modoDePreparo,
      'categoria': categoria,
    };
  }

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'] as String,
      nome: json['nome'] as String,
      ingredientes: json['ingredientes'] as String,
      modoDePreparo: json['modoDePreparo'] as String,
      categoria: json['categoria'] as String,
    );
  }
}
