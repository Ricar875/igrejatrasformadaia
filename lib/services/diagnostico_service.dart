class DiagnosticoService {
  // Calcula notas por área
  static Map<String, double> calcularNotas(
    Map<String, int> respostas,
    List<Pergunta> perguntas,
  ) {
    final areas = [
      'espiritual',
      'discipulado',
      'missao',
      'lideranca',
      'acolhimento',
      'financas'
    ];

    Map<String, double> notas = {};

    for (var area in areas) {
      var soma = 0;
      var count = 0;

      for (var p in perguntas.where((p) => p.area == area)) {
        var valor = respostas[p.id] ?? 0;
        if (p.inversa) valor = 4 - valor;
        soma += valor;
        count++;
      }

      if (count > 0) {
        notas[area] = (soma / (count * 4)) * 100;
      } else {
        notas[area] = 0;
      }
    }

    return notas;
  }

  // Gera plano de ação
  static List<String> gerarPlanoAcao(Map<String, double> notas) {
    final sugestoes = {
      'espiritual': 'Campanha de 21 dias de oração e jejum; cultos de quebrantamento semanais.',
      'discipulado': 'Implementar células com encontros quinzenais; criar escola de discipulado.',
      'missao': 'Mapear uma necessidade da vizinhança e servir; evangelismo criativo.',
      'lideranca': 'Reunião de alinhamento com os líderes; treinamento em gestão e pastoreio.',
      'acolhimento': 'Equipe de recepção treinada; visitas a membros afastados; almoços integrativos.',
      'financas': 'Auditoria simples; transparência total; campanha de mordomia com ensino bíblico.',
    };

    List<String> plano = [];

    for (var area in sugestoes.keys) {
      if (notas[area] != null && notas[area]! < 50) {
        plano.add('🔴 ${area.capitalize()}: ${sugestoes[area]}');
      }
    }

    if (plano.isEmpty) {
      plano.add('🎉 Parabéns! Todas as áreas estão acima de 50%. Foque em manter e fortalecer.');
    }

    return plano;
  }
}

extension StringCapitalize on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
