import '../services/auth_servide.dart';

class AuthController {
  final _authService = AuthService();

  Future<bool> login(String email, String senha) async {
    return await _authService.login(email, senha);
  }

  Future<bool> cadastrarUsuario(Map<String, dynamic> usuario) async {
    return await _authService.cadastrarUsuario(usuario);
  }
}
