class Favorito {
  final String id;
  final String usuarioId;
  final String animalId;

  Favorito({
    required this.id,
    required this.usuarioId,
    required this.animalId,
  });

  factory Favorito.fromMap(Map<String, dynamic> map) {
    return Favorito(
      id: map['id'],
      usuarioId: map['usuarioId'],
      animalId: map['animalId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'animalId': animalId,
    };
  }
}
