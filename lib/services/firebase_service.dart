import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pergunta.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Busca todas as perguntas ordenadas por ordem
  Future<List<Pergunta>> getPerguntas() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('perguntas')
          .orderBy('ordem')
          .get();

      return snapshot.docs.map((doc) {
        return Pergunta.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Erro ao buscar perguntas: $e');
    }
  }

  // Salva um diagnóstico
  Future<void> salvarDiagnostico({
    required String igrejaNome,
    required String pastor,
    required int membros,
    required int anoFundacao,
    required Map<String, int> respostas,
    required Map<String, double> notas,
    required double mediaGeral,
    required List<String> planoAcao,
  }) async {
    try {
      await _firestore.collection('diagnosticos').add({
        'igrejaNome': igrejaNome,
        'pastor': pastor,
        'membros': membros,
        'anoFundacao': anoFundacao,
        'data': DateTime.now(),
        'respostas': respostas,
        'notas': notas,
        'mediaGeral': mediaGeral,
        'planoAcao': planoAcao,
      });
    } catch (e) {
      throw Exception('Erro ao salvar diagnóstico: $e');
    }
  }

  // Busca histórico de diagnósticos
  Future<List<Map<String, dynamic>>> getHistorico() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('diagnosticos')
          .orderBy('data', descending: true)
          .limit(20)
          .get();

      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      throw Exception('Erro ao buscar histórico: $e');
    }
  }
}
