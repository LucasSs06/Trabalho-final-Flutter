class Tarefa {
  String titulo;
  bool concluida;
  DateTime? prazo;   // pode ser usado para metas diárias/semanal
  String categoria;  // exemplo: Trabalho, Estudos, Saúde

  Tarefa({
    required this.titulo,
    this.concluida = false,
    this.prazo,
    this.categoria = 'Geral',
  });

  // Para persistência simples (json)
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'concluida': concluida,
      'prazo': prazo?.toIso8601String(),
      'categoria': categoria,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'],
      concluida: map['concluida'] ?? false,
      prazo: map['prazo'] != null ? DateTime.parse(map['prazo']) : null,
      categoria: map['categoria'] ?? 'Geral',
    );
  }
}
