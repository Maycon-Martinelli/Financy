class AuthService {
  // Simula banco de dados local
  final List<Map<String, dynamic>> _usuarios = [];

  Future<bool> login(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 1));
    return _usuarios.any((u) => u['email'] == email && u['senha'] == senha);
  }

  Future<bool> cadastrarUsuario(Map<String, dynamic> usuario) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_usuarios.any((u) => u['email'] == usuario['email'])) return false;
    _usuarios.add(usuario);
    return true;
  }
}
