class Mensagem {
  final String id;
  final String remetenteId;
  final String destinatarioId;
  final String animalId;
  final String texto;
  final DateTime dataEnvio;

  Mensagem({
    required this.id,
    required this.remetenteId,
    required this.destinatarioId,
    required this.animalId,
    required this.texto,
    required this.dataEnvio,
  });

  factory Mensagem.fromMap(Map<String, dynamic> map) {
    return Mensagem(
      id: map['id'],
      remetenteId: map['remetenteId'],
      destinatarioId: map['destinatarioId'],
      animalId: map['animalId'],
      texto: map['texto'],
      dataEnvio: DateTime.parse(map['dataEnvio']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remetenteId': remetenteId,
      'destinatarioId': destinatarioId,
      'animalId': animalId,
      'texto': texto,
      'dataEnvio': dataEnvio.toIso8601String(),
    };
  }
}
