class Usuario {
  final String id;
  final String nome;
  final String email;
  final String senha;
  final String tipo; // 'adotante' ou 'ong'
  final String telefone;
  final String cidade;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.tipo,
    required this.telefone,
    required this.cidade,
  });
}
