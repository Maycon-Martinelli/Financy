class Animal {
  final String id;
  final String nome;
  final int idade;
  final String raca;
  final String especie;
  final String porte;
  final String descricao;
  final String status; // 'disponivel' ou 'adotado'
  final List<String> fotos; // alterado para lista de URLs de fotos
  final String donoId;

  Animal({
    required this.id,
    required this.nome,
    required this.idade,
    required this.raca,
    required this.especie,
    required this.porte,
    required this.descricao,
    required this.status,
    required this.fotos,
    required this.donoId,
  });

  // Retorna a primeira imagem, ou null se não tiver nenhuma
  String? get imagemUrl => fotos.isNotEmpty ? fotos.first : null;
}
