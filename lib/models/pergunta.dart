class Pergunta {
  final String id;
  final String area;
  final String pergunta;
  final bool inversa;
  final int ordem;

  Pergunta({
    required this.id,
    required this.area,
    required this.pergunta,
    required this.inversa,
    required this.ordem,
  });

  factory Pergunta.fromMap(Map<String, dynamic> map, String docId) {
    return Pergunta(
      id: docId,
      area: map['area'] ?? '',
      pergunta: map['pergunta'] ?? '',
      inversa: map['inversa'] ?? false,
      ordem: map['ordem'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'area': area,
      'pergunta': pergunta,
      'inversa': inversa,
      'ordem': ordem,
    };
  }
}
